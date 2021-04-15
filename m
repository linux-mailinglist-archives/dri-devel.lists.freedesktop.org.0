Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F17EF35FF76
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FB36E9B0;
	Thu, 15 Apr 2021 01:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C1E6E9A9;
 Thu, 15 Apr 2021 01:24:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZTwn7t/k0JXAdsjV3UG/49mQHS0WNb5DYVnD1etRU8BjgnG3QjA7cVjqJqSK2Njx+NVCqLkAVNyzkI6I8+IT+bfsgLRpEw+asnKArBBOMCuf1BHFsuyEum/sKf+v8UJdQ2qk0g0goet3UwXdcORF3ug+awtT1y9mc1nPKl5wW6cYDdK1H9+9mh3X5BEHQp01yic9pVCCUJTLnW5DQ2sD+oKY7a0njAJB793PRo7w63Q7LJ4t4+az574lIZUb7TP4HwcToi5u3Av0rKEsgZN+U9l0vwPJxddR1q6q+D5YwqOM10ko/uU3bmK/YpRFtqtEM2r3IbiSqGPSEsrm9JEghg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZROfDjv+RSx/nuaVUO8vzvVxB1tDINaGL1+fX2vSNw=;
 b=IXJ/kgrYdA+S0e5Zx1dgNVXpUQUXTva/PA986ez5ksmUOUdgdQ84xpUFn1cdaF0w234lKTPomcAlH37qPKXOeEHmKnWCccbfxymZTp6rqpvXm9CftJTgMhuPt3VzmG4/4CR2BbKsBYKPWDtazanPFdyOyKZpWR+i+tbNVPigECYZRtk5U7f5fe3gMMY9sCd6feFnXkab3y8pbsw9aRJsxC67wQXbsEQ5dtMZmJhBOZhLPmAg8G+T9uR/NW6nJj6ehinktaGlJTZ9/hze4cQR7Mg1PjK51uJOCjEJMllTeDZBR1Tewox1EfXkWsSvAg49cm8i0sYWhhCKMPA0SO6oDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZROfDjv+RSx/nuaVUO8vzvVxB1tDINaGL1+fX2vSNw=;
 b=yHEEiN3fUMF555BvtdDLEdGLTnwrmgkzkFnJ1nA68DoN0Q5mWqXcS1T56jVniTuuTZpXTMEulV9zgb6tv4tAK3wgwqxg1aSzxUbB782zTYaFepAbM7+Cg4FGXMze9Yaih9YZOavkmqTCGdFSKrf2huwSfcjUfrWsuHCMam3aiaU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 01:24:08 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:24:08 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 27/34] drm/amdkfd: add svm_bo eviction mechanism support
Date: Wed, 14 Apr 2021 21:23:30 -0400
Message-Id: <20210415012337.1755-28-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415012337.1755-1-Felix.Kuehling@amd.com>
References: <20210415012337.1755-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::48) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21 via Frontend
 Transport; Thu, 15 Apr 2021 01:24:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1051d650-4ffe-49d3-0060-08d8ffad2a40
X-MS-TrafficTypeDiagnostic: MN2PR12MB4208:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB42084AE7C1CE7A54805A8D7D924D9@MN2PR12MB4208.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /9l78/kWlXjPHEDf2rU/W8TbYItK1ULTYeYIdOSdm2VoEkhFexjcwlej9d7gVnZTY30KedycSBAmhLGL+1hAVMfMV9tP0Mz+FhKKBbMn40vBWMxbipwHKmDpZFpFvbeLQvDSna6Ofgc/aRgEkd3ktejr1lunnuBcPm/BKRnoUCHxN8CsF1/Vz9Q1QeL03/0F0kZd6TkoOHWtivnum1UgnPf1IaQ70Nqqk5fjw1F2wi47NIsDJtK1ZGM8fGLndaDtdGQJ+qCQArk1kdK2l3tTzB8I8FNViN3rqlMVKVchLmpvXAmrrugJsdaRaabzIKkBFazZYJ5ecXGZy3XTk9g4/gA3nikPotOqooqWvtoTT50xZbUvgjdfxGdZoBiAGNfBq17FCZv8R+Ye2oZ+cJ54SjZmYQfKAIcDR0Tww5yxlY4R2AhK6dVq9X80/tvCW832OO5ZUrprKQKhcaF0XK67FGJcGfmMqq+bUsIPea9gscu43qGCxbTnUQEu5++vWwa7bCQFjGETgDPdHGRyeAnV1NSC+dHeftKWfivHi1jFl8EMJJ9v5e9gzf4DiImBEoHDn+q6Y72aTNdsKwWMG7H7fVV+2D6wnDijFoPdaGXXatZvrh4UNIQCvn0IZsFki3YUGrOBq3u9fkPlkvH4QWm1eA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(2906002)(8936002)(83380400001)(66556008)(8676002)(66946007)(38100700002)(186003)(86362001)(6666004)(2616005)(956004)(38350700002)(5660300002)(66476007)(7696005)(6486002)(52116002)(16526019)(36756003)(54906003)(450100002)(478600001)(4326008)(1076003)(316002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vLm+sFOu2V71i0EVKz7rarDfq8BcDqItO4UXukvL8+SzPP1oDKDT9xoagGjN?=
 =?us-ascii?Q?BOHbTHf/xFD85VlaIVZAQquNeSZ23rUZZ8wsuNF+XE5guHiK8ETlVKucuIKg?=
 =?us-ascii?Q?PFkZGuEV0oYF5AI1YDaI6VUq57yLF3GoNRAjvaaUxGb1ZDGDP/s3EgYqjdmT?=
 =?us-ascii?Q?E3heHVZTKq+Nuwfk4gUHM/IMaF+eBeFEPwJHkxCJw50FvCXWKxTTkMFxZ372?=
 =?us-ascii?Q?MFz1OXN0HaH7aLzx/flj5YPtRETmzlo3vHYl2alI8Z91jEOVyrxIyFm+Ixum?=
 =?us-ascii?Q?sOfP0aevlOe/c4rvfYJCk3Z5Ul6Wb+YNb0BpeNFBkZj0FjyFXjrqTZEsBGGi?=
 =?us-ascii?Q?HR/9D4JbUcINqoC3uPg4aaB/wKiTkt0WEjvR9CsQnqjS6LDsvAlkfL+vPdG/?=
 =?us-ascii?Q?YN85k7SEox88c4GVdBc1dVeg1p8T+UT9Tno90DuZvQi9X6NbuIicu3T3Cs/q?=
 =?us-ascii?Q?KZpSb2vERPXoBMr7yw9OwPOQ+VFUlF/5L1it+X2C0ls78b2PyeLrFJwa7AJL?=
 =?us-ascii?Q?rBv7ehaiQ/CWI+qIUNAnnuZaQWoi/fy2xkcI1GprH7no2KId8wANvq9il1Zy?=
 =?us-ascii?Q?7y4Ghj/oPqSZk1Sqpm05Vp/Wonec7hHdeNv4Kvr9zGNsk/KAtHBStMp1ZRrz?=
 =?us-ascii?Q?bo4woJ2EKLFa6AvF9KPN+PjdCR0VwjlXD25MutALasso+EquVY+x6NdNnCDP?=
 =?us-ascii?Q?DrKZExfDbdmcFyspuROIJwHYGZc36syAmbFU9LrXce80OtvE/qx1iquyvlc0?=
 =?us-ascii?Q?GZ8cOwjJ1pgpMmebUEXdgncbDHGwS08CTuNXmhXYI9BtHK4va6jlKFGo0roF?=
 =?us-ascii?Q?bP5Col8CWQLDMFe2E6Mf9nmzyuasi7hCGPrviZHDGZFYqMxU6BpKOmj309MA?=
 =?us-ascii?Q?kqY7t4kdfhkvdSPNK/efTJVkfcQyP8SN6H4o9oV7Jo+OzJapTRuc0X2tZs0w?=
 =?us-ascii?Q?dZHYBP0M/Kico7PD+wdyuHnzuOstFgxyFMfS4IaPfwu489Ae9QAQK9wWxR2A?=
 =?us-ascii?Q?FYC+a8f7WOCmKWQ1ZC2X2WdYHkV2mWuThePEfpI5ku0NnaaKv7RV3cVZlOCE?=
 =?us-ascii?Q?0ZZDbQaHcinuLUK14CrjWFfwqtRCmdZGNR/H2HOiCxB2dNKyNOmGO6GMe/Cm?=
 =?us-ascii?Q?sQSrIcs0qcpfALFrDadb1yipn4iECHSsVN/KyG6QyBC3Mi0EkimJL0n6mqwD?=
 =?us-ascii?Q?bnNCQZkcfnILhEoOQuRvsM1qmd3d/h9VjlHAv99XiUJWs0g/BpOB80ApIWHx?=
 =?us-ascii?Q?qtgyHgh4SYdoRzyRpi+GSbK3xNpwaNyjUfyDnUB45GgHoMRylA8cwvTdHRA8?=
 =?us-ascii?Q?11oSUzQT/k6ZsHblDo4NlVrq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1051d650-4ffe-49d3-0060-08d8ffad2a40
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:24:07.7780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x4jAFNTTCbA7ya3Apnxm+yaqSJhxvWA5bfsLFMGa3NtaNc/ws70MmgLu2nZXVWhRzmiNlBgzS2cEzMdQRPzwTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208
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
Cc: Alex Sierra <alex.sierra@amd.com>, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

svm_bo eviction mechanism is different from regular BOs.
Every SVM_BO created contains one eviction fence and one
worker item for eviction process.
SVM_BOs can be attached to one or more pranges.
For SVM_BO eviction mechanism, TTM will start to call
enable_signal callback for every SVM_BO until VRAM space
is available.
Here, all the ttm_evict calls are synchronous, this guarantees
that each eviction has completed and the fence has signaled before
it returns.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 201 +++++++++++++++++++++------
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h |  13 +-
 2 files changed, 168 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index d89c998f9aa4..6d3add17fcac 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -35,6 +35,7 @@
 
 #define AMDGPU_SVM_RANGE_RESTORE_DELAY_MS 1
 
+static void svm_range_evict_svm_bo_worker(struct work_struct *work);
 static bool
 svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
 				    const struct mmu_notifier_range *range,
@@ -320,7 +321,15 @@ static void svm_range_bo_release(struct kref *kref)
 		spin_lock(&svm_bo->list_lock);
 	}
 	spin_unlock(&svm_bo->list_lock);
-
+	if (!dma_fence_is_signaled(&svm_bo->eviction_fence->base)) {
+		/* We're not in the eviction worker.
+		 * Signal the fence and synchronize with any
+		 * pending eviction work.
+		 */
+		dma_fence_signal(&svm_bo->eviction_fence->base);
+		cancel_work_sync(&svm_bo->eviction_work);
+	}
+	dma_fence_put(&svm_bo->eviction_fence->base);
 	amdgpu_bo_unref(&svm_bo->bo);
 	kfree(svm_bo);
 }
@@ -333,6 +342,61 @@ static void svm_range_bo_unref(struct svm_range_bo *svm_bo)
 	kref_put(&svm_bo->kref, svm_range_bo_release);
 }
 
+static bool svm_range_validate_svm_bo(struct svm_range *prange)
+{
+	mutex_lock(&prange->lock);
+	if (!prange->svm_bo) {
+		mutex_unlock(&prange->lock);
+		return false;
+	}
+	if (prange->ttm_res) {
+		/* We still have a reference, all is well */
+		mutex_unlock(&prange->lock);
+		return true;
+	}
+	if (svm_bo_ref_unless_zero(prange->svm_bo)) {
+		if (READ_ONCE(prange->svm_bo->evicting)) {
+			struct dma_fence *f;
+			struct svm_range_bo *svm_bo;
+			/* The BO is getting evicted,
+			 * we need to get a new one
+			 */
+			mutex_unlock(&prange->lock);
+			svm_bo = prange->svm_bo;
+			f = dma_fence_get(&svm_bo->eviction_fence->base);
+			svm_range_bo_unref(prange->svm_bo);
+			/* wait for the fence to avoid long spin-loop
+			 * at list_empty_careful
+			 */
+			dma_fence_wait(f, false);
+			dma_fence_put(f);
+		} else {
+			/* The BO was still around and we got
+			 * a new reference to it
+			 */
+			mutex_unlock(&prange->lock);
+			pr_debug("reuse old bo svms 0x%p [0x%lx 0x%lx]\n",
+				 prange->svms, prange->start, prange->last);
+
+			prange->ttm_res = &prange->svm_bo->bo->tbo.mem;
+			return true;
+		}
+
+	} else {
+		mutex_unlock(&prange->lock);
+	}
+
+	/* We need a new svm_bo. Spin-loop to wait for concurrent
+	 * svm_range_bo_release to finish removing this range from
+	 * its range list. After this, it is safe to reuse the
+	 * svm_bo pointer and svm_bo_list head.
+	 */
+	while (!list_empty_careful(&prange->svm_bo_list))
+		;
+
+	return false;
+}
+
 static struct svm_range_bo *svm_range_bo_new(void)
 {
 	struct svm_range_bo *svm_bo;
@@ -352,72 +416,56 @@ int
 svm_range_vram_node_new(struct amdgpu_device *adev, struct svm_range *prange,
 			bool clear)
 {
-	struct amdkfd_process_info *process_info;
 	struct amdgpu_bo_param bp;
 	struct svm_range_bo *svm_bo;
 	struct amdgpu_bo_user *ubo;
 	struct amdgpu_bo *bo;
 	struct kfd_process *p;
+	struct mm_struct *mm;
 	int r;
 
-	pr_debug("[0x%lx 0x%lx]\n", prange->start, prange->last);
-	mutex_lock(&prange->lock);
-	if (prange->svm_bo) {
-		if (prange->ttm_res) {
-			/* We still have a reference, all is well */
-			mutex_unlock(&prange->lock);
-			return 0;
-		}
-		if (svm_bo_ref_unless_zero(prange->svm_bo)) {
-			/* The BO was still around and we got
-			 * a new reference to it
-			 */
-			mutex_unlock(&prange->lock);
-			pr_debug("reuse old bo [0x%lx 0x%lx]\n",
-				prange->start, prange->last);
-
-			prange->ttm_res = &prange->svm_bo->bo->tbo.mem;
-			return 0;
-		}
-
-		mutex_unlock(&prange->lock);
-
-		/* We need a new svm_bo. Spin-loop to wait for concurrent
-		 * svm_range_bo_release to finish removing this range from
-		 * its range list. After this, it is safe to reuse the
-		 * svm_bo pointer and svm_bo_list head.
-		 */
-		while (!list_empty_careful(&prange->svm_bo_list))
-			;
+	p = container_of(prange->svms, struct kfd_process, svms);
+	pr_debug("pasid: %x svms 0x%p [0x%lx 0x%lx]\n", p->pasid, prange->svms,
+		 prange->start, prange->last);
 
-	} else {
-		mutex_unlock(&prange->lock);
-	}
+	if (svm_range_validate_svm_bo(prange))
+		return 0;
 
 	svm_bo = svm_range_bo_new();
 	if (!svm_bo) {
 		pr_debug("failed to alloc svm bo\n");
 		return -ENOMEM;
 	}
-
+	mm = get_task_mm(p->lead_thread);
+	if (!mm) {
+		pr_debug("failed to get mm\n");
+		kfree(svm_bo);
+		return -ESRCH;
+	}
+	svm_bo->svms = prange->svms;
+	svm_bo->eviction_fence =
+		amdgpu_amdkfd_fence_create(dma_fence_context_alloc(1),
+					   mm,
+					   svm_bo);
+	mmput(mm);
+	INIT_WORK(&svm_bo->eviction_work, svm_range_evict_svm_bo_worker);
+	svm_bo->evicting = 0;
 	memset(&bp, 0, sizeof(bp));
 	bp.size = prange->npages * PAGE_SIZE;
 	bp.byte_align = PAGE_SIZE;
 	bp.domain = AMDGPU_GEM_DOMAIN_VRAM;
 	bp.flags = AMDGPU_GEM_CREATE_NO_CPU_ACCESS;
 	bp.flags |= clear ? AMDGPU_GEM_CREATE_VRAM_CLEARED : 0;
+	bp.flags |= AMDGPU_AMDKFD_CREATE_SVM_BO;
 	bp.type = ttm_bo_type_device;
 	bp.resv = NULL;
 
 	r = amdgpu_bo_create_user(adev, &bp, &ubo);
 	if (r) {
 		pr_debug("failed %d to create bo\n", r);
-		kfree(svm_bo);
-		return r;
+		goto create_bo_failed;
 	}
 	bo = &ubo->bo;
-
-	p = container_of(prange->svms, struct kfd_process, svms);
 	r = amdgpu_bo_reserve(bo, true);
 	if (r) {
 		pr_debug("failed %d to reserve bo\n", r);
@@ -430,8 +478,7 @@ svm_range_vram_node_new(struct amdgpu_device *adev, struct svm_range *prange,
 		amdgpu_bo_unreserve(bo);
 		goto reserve_bo_failed;
 	}
-	process_info = p->kgd_process_info;
-	amdgpu_bo_fence(bo, &process_info->eviction_fence->base, true);
+	amdgpu_bo_fence(bo, &svm_bo->eviction_fence->base, true);
 
 	amdgpu_bo_unreserve(bo);
 
@@ -447,8 +494,10 @@ svm_range_vram_node_new(struct amdgpu_device *adev, struct svm_range *prange,
 	return 0;
 
 reserve_bo_failed:
-	kfree(svm_bo);
 	amdgpu_bo_unref(&bo);
+create_bo_failed:
+	dma_fence_put(&svm_bo->eviction_fence->base);
+	kfree(svm_bo);
 	prange->ttm_res = NULL;
 
 	return r;
@@ -2329,6 +2378,74 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
 	return r;
 }
 
+int svm_range_schedule_evict_svm_bo(struct amdgpu_amdkfd_fence *fence)
+{
+	if (!fence)
+		return -EINVAL;
+
+	if (dma_fence_is_signaled(&fence->base))
+		return 0;
+
+	if (fence->svm_bo) {
+		WRITE_ONCE(fence->svm_bo->evicting, 1);
+		schedule_work(&fence->svm_bo->eviction_work);
+	}
+
+	return 0;
+}
+
+static void svm_range_evict_svm_bo_worker(struct work_struct *work)
+{
+	struct svm_range_bo *svm_bo;
+	struct kfd_process *p;
+	struct mm_struct *mm;
+
+	svm_bo = container_of(work, struct svm_range_bo, eviction_work);
+	if (!svm_bo_ref_unless_zero(svm_bo))
+		return; /* svm_bo was freed while eviction was pending */
+
+	/* svm_range_bo_release destroys this worker thread. So during
+	 * the lifetime of this thread, kfd_process and mm will be valid.
+	 */
+	p = container_of(svm_bo->svms, struct kfd_process, svms);
+	mm = p->mm;
+	if (!mm)
+		return;
+
+	mmap_read_lock(mm);
+	spin_lock(&svm_bo->list_lock);
+	while (!list_empty(&svm_bo->range_list)) {
+		struct svm_range *prange =
+				list_first_entry(&svm_bo->range_list,
+						struct svm_range, svm_bo_list);
+		list_del_init(&prange->svm_bo_list);
+		spin_unlock(&svm_bo->list_lock);
+
+		pr_debug("svms 0x%p [0x%lx 0x%lx]\n", prange->svms,
+			 prange->start, prange->last);
+
+		mutex_lock(&prange->migrate_mutex);
+		svm_migrate_vram_to_ram(prange, svm_bo->eviction_fence->mm);
+
+		mutex_lock(&prange->lock);
+		prange->svm_bo = NULL;
+		mutex_unlock(&prange->lock);
+
+		mutex_unlock(&prange->migrate_mutex);
+
+		spin_lock(&svm_bo->list_lock);
+	}
+	spin_unlock(&svm_bo->list_lock);
+	mmap_read_unlock(mm);
+
+	dma_fence_signal(&svm_bo->eviction_fence->base);
+	/* This is the last reference to svm_bo, after svm_range_vram_node_free
+	 * has been called in svm_migrate_vram_to_ram
+	 */
+	WARN_ONCE(kref_read(&svm_bo->kref) != 1, "This was not the last reference\n");
+	svm_range_bo_unref(svm_bo);
+}
+
 static int
 svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 		   uint32_t nattr, struct kfd_ioctl_svm_attribute *attrs)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 9a078d354cba..11b04a706ff9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -34,10 +34,14 @@
 #include "kfd_priv.h"
 
 struct svm_range_bo {
-	struct amdgpu_bo	*bo;
-	struct kref		kref;
-	struct list_head	range_list; /* all svm ranges shared this bo */
-	spinlock_t		list_lock;
+	struct amdgpu_bo		*bo;
+	struct kref			kref;
+	struct list_head		range_list; /* all svm ranges shared this bo */
+	spinlock_t			list_lock;
+	struct amdgpu_amdkfd_fence	*eviction_fence;
+	struct work_struct		eviction_work;
+	struct svm_range_list		*svms;
+	uint32_t			evicting;
 };
 
 enum svm_work_list_ops {
@@ -157,6 +161,7 @@ int svm_range_split_by_granularity(struct kfd_process *p, struct mm_struct *mm,
 			       struct svm_range *prange);
 int svm_range_restore_pages(struct amdgpu_device *adev,
 			    unsigned int pasid, uint64_t addr);
+int svm_range_schedule_evict_svm_bo(struct amdgpu_amdkfd_fence *fence);
 void svm_range_add_list_work(struct svm_range_list *svms,
 			     struct svm_range *prange, struct mm_struct *mm,
 			     enum svm_work_list_ops op);
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
