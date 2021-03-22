Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B89E343F0D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93D56E3FE;
	Mon, 22 Mar 2021 11:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A07C6E0C5;
 Mon, 22 Mar 2021 11:07:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BDwcBNgiIeyPjyLfwMdMbHKs2l9ZVRX/HTkUEmdNrQlOcN2aVWSVeipLt4SpBuKlRzLZOWQx0kD+xuO47JSKQQ3bKqmoMAekNDIhMiIWOa43WOUqA3tFxRtte/uXyUS9ePIudLMeXqg89GdVMuEeiS9cezbZBGcvHn38gAiDyUOKT6mExblqkCcaM5lCy/EBtOQk00rSE04e03DD/tkuQsmxTt3ryZ99W9E02skqzU+95v9y85PTnUpzcsPsG+xViPDfDGb8dNph2OgcMCBF+BhMhQqguPX7iS19W7ofQLzp9d9DO1nQdjqFfGLGoVjdvedR0WYIGlv/LQo19Y/XHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+E21NBSUnbwO80lM0o7jlirRLIYUu0jUt6pQ4AuFuE=;
 b=ROVbTiRK/atiojmLKDY4gR0f3TTLsswr5pLCVCK8bE2V4SloW3+BUsUBc/Ctu0PIz0N9iFeq+9rFZ7EEadshR8UndLFpqsFemBSsKIYTad4SQNmlwPsRXbTgbwP48wiSSKY2bX9DFpEV0JWtPWqdNoEahkzFhLO30kWjZDjJYF1w6Rkallw0TQM5k4xk2/CLUp7bh2JSz92qyDJhNiIP7N+Z1JAuk/8wKteWlZRsnWHUFqRkjGN4NE2sWAjPj3THwMu5646CM1F2l0kaG+KYoOSBMONTMGmi/FTk99gOOLvU5dR30gZdyixuQayTU3dVHEIG2w+PStfggCnQqDtMHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+E21NBSUnbwO80lM0o7jlirRLIYUu0jUt6pQ4AuFuE=;
 b=xpJjGDw2FGOaVGKJH7pccz1PAOR0wpqcmPobSHFd/wyk4R4v9OX3MAGQ2sNS81BRd0Q+7X8CyvF+FlLNe/Y77hhox1Mv5nTUvPqRmRPig558w6j+veEGRg6CI7kcA6SDcGDRf9VNVtk2qaXekOqZF6K2eq+xY2YN9rnKExW+Shc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4899.namprd12.prod.outlook.com (2603:10b6:208:1cf::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:44 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:44 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 26/44] drm/amdkfd: add svm_bo eviction mechanism support
Date: Mon, 22 Mar 2021 06:58:42 -0400
Message-Id: <20210322105900.14068-27-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210322105900.14068-1-Felix.Kuehling@amd.com>
References: <20210322105900.14068-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24 via Frontend
 Transport; Mon, 22 Mar 2021 11:07:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b5040f11-2aad-45da-58d0-08d8ed22b78b
X-MS-TrafficTypeDiagnostic: BL0PR12MB4899:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB489918EEA9E8C159C4D21E1E92659@BL0PR12MB4899.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oe6VWMTVlguBtJfR9PXv2xqXDkMaPcMMNm/RvCImknYUfVfuqKLfos+daQ+05eJaIXbNgPZMxkfZDwfVEq1bgJEb2+FWj3xG+5tfzIFSGmF3gJepAYp8szutKM4C6rCJPdzvPngSRuLj2iBo4Qo53Wo5DmvHqaikNn13f8MAYETyJWra4DSocgsB3tUckk8Dwbf/bzAIdo25NabRh930VIv4q860sMZbxcEyKsUvwgKJAxwsGWYFmG6kQ3J2LFxAH5e32i+bYwGLzW9w4L/x5Ao9M0B+HxxbLWRBaA7bFgdenCcmIsorgbTPG+qbIC/yyQpeLYeYjPGvf4y/Sdb64ceIUnJt9vgzpnrbnLg8JO4OCa831zM3LCGTt3ZgMMsAJEmky67pqsFh/Swk4T7EwUh/cBS5quKH61lFuEPV9CwELw+w1i7GMlnFa2sIzr+BrqmpSLlUOdVmpAyuqkh26mEe00y5+MljF1Jud2jcp2yKlwve0qVcRCAT9UsVZoJNdYauYSDayWEc0sYjV5e61otP05HaNaiOXZ+s569suWe5MRPZLvS4DTUf0xcaEhakLxlXGJcjeC10WhCLWTfSyamIucFjq0frq9uKZuWYbIbJqAP3VzS7e5TTVRaT0hp8GJ6ay2wdAlaBdwBPqaRLSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(36756003)(83380400001)(66556008)(66476007)(186003)(66946007)(2616005)(8676002)(956004)(16526019)(86362001)(8936002)(26005)(478600001)(6486002)(5660300002)(4326008)(450100002)(316002)(2906002)(54906003)(7696005)(1076003)(52116002)(38100700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QA0mKrBilHVg/wLfnssu8IqC1O6vloPd2hNmvUVWl/FqZNWlpllwmClmBZAk?=
 =?us-ascii?Q?ZxhYMNbcnq5Xm8JpQ68kJnkLGE0BGHgNQCq96GvxyT0L2grqKy4BGp1ci5H2?=
 =?us-ascii?Q?L8ykP/aCFq4pLxcVgArvu7stkERptfTROSHL+XKayoQO732gnTHXwbPclMF+?=
 =?us-ascii?Q?A8T613HOnxLefFXbWxRVNc2+OE8gH3cxchbM+NoV+HoVsI/cM+BbV0evCQ9l?=
 =?us-ascii?Q?HKEee6U+mCwRc26GEyi5CW9eHGKenKULn8BIbyauote9Bue0bP5AXYI84Hif?=
 =?us-ascii?Q?W/1ZibpA9ghzWy3UGqV76JU5y+gztDkN684pD781QqxxsPJyMBJTMF8OmI5K?=
 =?us-ascii?Q?dnwWRccwzuQW7Rp8iRfi3lGFJIqivxdZ0iji99KWU2xmASJJ3/fTWGKxaVNy?=
 =?us-ascii?Q?PB2dhXgAuAB/HTC0KUf+gU42x0PDTDf+VSV2L1sO2feAOKi0Z0wFHiwcoaqs?=
 =?us-ascii?Q?/jzfjLSXG0ek7v8p5GEwFRu+MpDTgYe6Vtm3ABxQg3Jw7KK11y0wp8kWKjlZ?=
 =?us-ascii?Q?dk7yPjiwcYAXWDrj2orQINCLRYk67OJaKKHZ0djbMYcuvXiE8uMCLMgUkNg9?=
 =?us-ascii?Q?14VZLWc8ltc55rBwJruOa+hdn52ddr/jVGSLrNryMw+fdiZRZeRNE9sNbyIf?=
 =?us-ascii?Q?2imb0VttB1nQmiwIxdR1A4zeMqqVlRZQ0HqsSkz5kmd6XAOaji4FdU6kSpyl?=
 =?us-ascii?Q?X071j8dITDL833uklI9N0Nwsnri3D0CVX8t7rB9aNLVK07/T5vlL4UccTnD2?=
 =?us-ascii?Q?LKxzPRsACrEyHKdo7qcarfUzwQw0t8LTR1xx6Jly62HxUMqVkd9UXmldFDmg?=
 =?us-ascii?Q?Hzu+BlXPirVz34uAtWblOXhlL0OFLj17MZ3+evx9LUyfbE+ZypOnw9phr7H9?=
 =?us-ascii?Q?HdUZQiGrQTvkNOB/loR2+TdkADM6cSHceME3EVwiF7dtWmswb19lUPIRNzay?=
 =?us-ascii?Q?aid/aIg4Bcbvo9Gu1aZtWmhfE6fMyVqR8+1VHFGxkR6eaOZKic4b1Z4DnCZu?=
 =?us-ascii?Q?7q+5yvIDsF/ovRTLAMtNLlQYwTHIp3N2vf+tjo5/Sqs4+y1PZq+PDhfv35ak?=
 =?us-ascii?Q?MfEz2qD6n/bzU098G5GakPHx+zp1B1m7O70D6gRLlQN6e1IcrX9l0Yje3aqB?=
 =?us-ascii?Q?ls9TPHf/Gwo01+d5Nen/v+aWp4VcX9udwgl4/T00xsm8ytosi2FbRWRk+Ur+?=
 =?us-ascii?Q?7cVs2q2gARHIkLY2b6T7TdFtyWux15ZI0FrSdQn0BWUIdoLc7oAHyeecM6J1?=
 =?us-ascii?Q?616jZODVM6VsEpbWa3u3ekYun6Lvi0Gbu/z4vc2JL6lu+qh4P7TabN9tdFGr?=
 =?us-ascii?Q?ud/aaXvKvVjAAuxVcKkY0XG4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5040f11-2aad-45da-58d0-08d8ed22b78b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:43.8830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: naSJKBQ+4KIuDGTwMIIJQaGc4pUh0fnnhJctifnxdlEvFaDEJ3qi8ZFH/HbyRvKBMJ/xE7c8suFnp2qRuCXXFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4899
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
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 186 +++++++++++++++++++++------
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h |  13 +-
 2 files changed, 153 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index c791d91cb45d..3a7b842b362c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -34,6 +34,7 @@
 
 #define AMDGPU_SVM_RANGE_RESTORE_DELAY_MS 1
 
+static void svm_range_evict_svm_bo_worker(struct work_struct *work);
 static bool
 svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
 				    const struct mmu_notifier_range *range,
@@ -332,7 +333,15 @@ static void svm_range_bo_release(struct kref *kref)
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
@@ -345,6 +354,61 @@ static void svm_range_bo_unref(struct svm_range_bo *svm_bo)
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
@@ -364,72 +428,56 @@ int
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
@@ -442,8 +490,7 @@ svm_range_vram_node_new(struct amdgpu_device *adev, struct svm_range *prange,
 		amdgpu_bo_unreserve(bo);
 		goto reserve_bo_failed;
 	}
-	process_info = p->kgd_process_info;
-	amdgpu_bo_fence(bo, &process_info->eviction_fence->base, true);
+	amdgpu_bo_fence(bo, &svm_bo->eviction_fence->base, true);
 
 	amdgpu_bo_unreserve(bo);
 
@@ -459,8 +506,10 @@ svm_range_vram_node_new(struct amdgpu_device *adev, struct svm_range *prange,
 	return 0;
 
 reserve_bo_failed:
-	kfree(svm_bo);
 	amdgpu_bo_unref(&bo);
+create_bo_failed:
+	dma_fence_put(&svm_bo->eviction_fence->base);
+	kfree(svm_bo);
 	prange->ttm_res = NULL;
 
 	return r;
@@ -2267,6 +2316,59 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
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
+	struct svm_range *prange;
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
+	list_for_each_entry(prange, &svm_bo->range_list, svm_bo_list) {
+		pr_debug("svms 0x%p [0x%lx 0x%lx]\n", prange->svms,
+			 prange->start, prange->last);
+		mutex_lock(&prange->migrate_mutex);
+		svm_migrate_vram_to_ram(prange, svm_bo->eviction_fence->mm);
+		mutex_unlock(&prange->migrate_mutex);
+	}
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
index 3aa6f6b97481..f8e282ec9d8a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -33,10 +33,14 @@
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
@@ -161,6 +165,7 @@ int svm_range_split_by_granularity(struct kfd_process *p, struct mm_struct *mm,
 			       struct list_head *deferred_update_list);
 int svm_range_restore_pages(struct amdgpu_device *adev,
 			    unsigned int pasid, uint64_t addr);
+int svm_range_schedule_evict_svm_bo(struct amdgpu_amdkfd_fence *fence);
 void svm_range_add_list_work(struct svm_range_list *svms,
 			     struct svm_range *prange, struct mm_struct *mm,
 			     enum svm_work_list_ops op);
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
