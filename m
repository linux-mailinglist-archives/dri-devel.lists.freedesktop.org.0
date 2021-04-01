Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF519350DCF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702D56EC50;
	Thu,  1 Apr 2021 04:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5450D6EC50;
 Thu,  1 Apr 2021 04:23:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RdWX9rwLPfyu+gofbYqmxJTBzXOnodDkWOx15tZYQeDBauUIVCTH/t/TIz8lQrSWr+vwkYfJNxKmYhbj8qAPwHz6TdEwlH+A6IHSl7LpwMo2hL+3V2CMqXvOGNNq865FSvmnE8f7zjPpddjtL5Jie6PnZ90is32J2plf0t4dpJ1PUpaNaT/MFsgFXvj8LOUT2RC4+n2eyvLmmUv0+mpt35K8P73gxvxeSKANy9OxSvzZNrnGZA22LL6H0Lb8u4iMtUOE40zN88adZHpksYn6StlpZMAfanzstEy2YEH2J6tM4nhmIRLtxja5Vgee03Rbz1BNKjZMf+qYdP1iaNWWkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vlxld2vNSRcp4+K/z8yYbAFWpPg7eEc5NyRp42AwXXU=;
 b=i8TvK+ZAeiBes1OohtGOKhP6Cryi81fLO8t1f1zpd7cdt96nIaKjlqbcApPDoJCYfK1gYPtQME35BlKV+VZBVohWe4/ijVpLXXNPFIJ20HxZtNWoyM3oiykpHLz79ISOHYELMINpLxRsKEO9BCVqISTm3jSJ9Y0BEI3FjucJXwfCdfCnze7Itg8IpwTqu4nIDoEOKh9/PquYilgWL4QhVJkL6tIm73ebZsgBw1Te10eyVU9mJKj7xEErNV1YxHHtKwQUYiJ1PzuOAmiUu49favzFxybIn2O6idsmBLNuSe0SrfKEuvbNlsO+6IiT8Mab7+nsADFcJ8VoJSxnvWhxhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vlxld2vNSRcp4+K/z8yYbAFWpPg7eEc5NyRp42AwXXU=;
 b=O08n/dsdUiwfNAhUHLOUkFYeNC+WaJhdE1jSP0R5ZhesgmJJvZTd02a/DR5C+EnTw/lQBpjPhH+cuWQudOtShnTbrrDOOK0pXvyxA1ocjO5PoTlkDlN5yhpKMu2h9F91TVTQFV54O4pwO4ejSFzqa30eaSCHw8NIFESJNU2wNrw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 1 Apr
 2021 04:23:07 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:23:07 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 26/34] drm/amdkfd: add svm_bo eviction mechanism support
Date: Thu,  1 Apr 2021 00:22:20 -0400
Message-Id: <20210401042228.1423-27-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401042228.1423-1-Felix.Kuehling@amd.com>
References: <20210401042228.1423-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::27) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:23:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c04eefdd-f9bd-4b3c-5d7a-08d8f4c5d9bd
X-MS-TrafficTypeDiagnostic: MN2PR12MB4222:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4222780E6A251D1010B47F46927B9@MN2PR12MB4222.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2oriT5huRkY93nlIY0TqWSp0zUCFeSJXLOOh0LxH52oGwtrEjPMoUa3DrHR0NTQBk9RmL7HRcwxiWemRkDeBfAXGdM7JEUDtNh8LcyIoW503TYbUCOXxiuEyME2RJvZoHoXL/WYgxrXD8pIOrSrGoLrhsylmPCY0KinNGbeXiH1t7nlKv2qFV3LnST5BmZ4o1jslUy0A65xaS1HCNEYV/nU4YF6M0U05Mi+ukKF8BnM1tyDtKsUr++OF49XB7GBqUmEgJWLcWLNBrecNy1ubupyioSVCZer2QGy3F5UuxlOMoeVLIZcRAkinLtxxY9HiM5Fvbimu/jw0Wf1myXYePJf+OLai9JKYz+/RAaGgKRhseRVPaEDXMxX3p3CvyvX2qrC6j3IgiWPq1/9M1Wvym+QnU+Ue2wuGRZx6Sp6P7Rt1TtAaAoeIur9vxNpFVZrDmBWADkt0BxCEBC6f3jl3O4ud/9gRtLPjI4Ro0kaQ2PCuZpzz32o/xLhdowivxi5ZcCnUUuR2j0u4D+s5l1wKmvJlVoYdr/uQHxanc9jTYf7BzIe5qwWv28yydjiscK5wDZ8QZ/A/i/01YXXoceOG6LVTt0fJyX6G9WcWCtawS1nQsax0fturlu/kAwsTkJslO8aEVsSKC6eB4eilc8se+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(1076003)(316002)(52116002)(66476007)(38100700001)(2616005)(956004)(54906003)(5660300002)(2906002)(6666004)(186003)(16526019)(4326008)(450100002)(66556008)(8936002)(83380400001)(36756003)(86362001)(8676002)(6486002)(7696005)(478600001)(26005)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?RzAH7aCjVQoKfIZUE1U8wjb5EmWnFmImNC5Jin111jtD1wQUQ8EYEfAOQddm?=
 =?us-ascii?Q?vwbhFzvKrcoXKt5YB3iJGZDLbNIaaNJnC78kY7+GqU5VR/xndQPGUx3HIxbw?=
 =?us-ascii?Q?wl/3TKkmqY8BADptYrg24hlFvolcvoQh7r65tDAS6sqASqlzcwXpBnLOZa9s?=
 =?us-ascii?Q?8mjJoovYbeM4MMXzdb+IaFfMB/Fe9sERUEArLaNHr0NEHN+zuU9uLv1APMmy?=
 =?us-ascii?Q?2qg8ylQcuKhf30s8dExm7zJZ5yZlVSXj9Y/z/y2g09Y6tOBhwlwFs66Qvflb?=
 =?us-ascii?Q?uSAoat/kY4X3P2JddyLkJZc3udcc6B9m1ES6TAWBTfcSzWo+oPKhnGlAxdxn?=
 =?us-ascii?Q?lEcFobbtbohto6Ycmkt5pUVBg94ti2KgAsmzgZpkojvO1AA45UBb1yjqXiLl?=
 =?us-ascii?Q?eIU7iZPrknJ8Ej9BT40HcZ8YXwS4qxBoxjDckPORiYSFpf6hxa7wJ0sj7N0/?=
 =?us-ascii?Q?qGjYr8Iatitf5rZ+jA2OdWR+LlCb8n+lGq6wofFgtSL6eEodezEGJQt5u/r8?=
 =?us-ascii?Q?KX7zAHsqYQIdqadc3N3vmXiKh4OSTR2gV+0L8cr8BSMfbnh7+Yb82bZfMY7d?=
 =?us-ascii?Q?VBGdVygtHdR0PGgksx1YmD4DMxWrwXUDXaE1ygOKzrUOe+TJ79kS7McbH+Ml?=
 =?us-ascii?Q?YWF8D3t+3kKeltLqLgSDKPLr/QlyTEwanMNMazdIG5sBUzEdGTRpQ1eDj1td?=
 =?us-ascii?Q?u74Yt2hxWNo1047GgbDd1dirOaxrIU48R19u4YtQc8F6gBntmNMIMOSK1K1a?=
 =?us-ascii?Q?Ezq06NXZszy2nFe9toLpSlVCAX6J3MGDqr8Wz+q6Ox4VwNFWPBvEYOOcK02P?=
 =?us-ascii?Q?MUbjCp842sVR3gKjncVfBZeDO2kLBF/s9SaBM1bWdlhvPjIvFWEJOrAjpEBZ?=
 =?us-ascii?Q?MIiFxF4/t3ZVKKWqAy8ZgQ8cwSvbLVda0sIhDqsTyIopFJ34jh4QOG+998I6?=
 =?us-ascii?Q?2byZpq1vRIR2Kz1bo3PiRR8cNDW8jxS9q05H0gGRnr4d7VKtKUojE8a0mC5t?=
 =?us-ascii?Q?lWMmidU2WzGN2zyz9AXIxYZ3OkZpf5qIW/cBj25G1WT1xDLqzZF0mbamddpb?=
 =?us-ascii?Q?LKDwGO3H8uCglf/XZldUzm98cdZMYE5PlMOERmNQDTVc6GXbxN1U67f5BKdt?=
 =?us-ascii?Q?NxqvIM5GbgTUNF0TZtq1sSJu48GnhkdnPrZnFYqTEP6PrlLoLo8SZDC7IxT4?=
 =?us-ascii?Q?1APhWtV3nqTFD9PL3nP2N0GPh5SSNWffVVWe+SRA8jNfQNKMuR1FswyITNPr?=
 =?us-ascii?Q?V3uRWIIsNCW8Xgoh+CPg75x9HJw/gPrsRj3mR5AH3l4TGHmhZhUY3uVNUaYe?=
 =?us-ascii?Q?ZGkLGTp5yZb2E37UtOancD50?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c04eefdd-f9bd-4b3c-5d7a-08d8f4c5d9bd
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:23:07.4085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rLSzJjWHPzu7wKDE3vQ744c557jt18L/Xu7Jow+2BdBMlLPPr0uIteyNI61vcaReAaVub45PJ0QKO6kLLpt8aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4222
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
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 201 +++++++++++++++++++++------
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h |  13 +-
 2 files changed, 168 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 7b2c97b7f48c..77da6c68fab2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -34,6 +34,7 @@
 
 #define AMDGPU_SVM_RANGE_RESTORE_DELAY_MS 1
 
+static void svm_range_evict_svm_bo_worker(struct work_struct *work);
 static bool
 svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
 				    const struct mmu_notifier_range *range,
@@ -319,7 +320,15 @@ static void svm_range_bo_release(struct kref *kref)
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
@@ -332,6 +341,61 @@ static void svm_range_bo_unref(struct svm_range_bo *svm_bo)
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
@@ -351,72 +415,56 @@ int
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
@@ -429,8 +477,7 @@ svm_range_vram_node_new(struct amdgpu_device *adev, struct svm_range *prange,
 		amdgpu_bo_unreserve(bo);
 		goto reserve_bo_failed;
 	}
-	process_info = p->kgd_process_info;
-	amdgpu_bo_fence(bo, &process_info->eviction_fence->base, true);
+	amdgpu_bo_fence(bo, &svm_bo->eviction_fence->base, true);
 
 	amdgpu_bo_unreserve(bo);
 
@@ -446,8 +493,10 @@ svm_range_vram_node_new(struct amdgpu_device *adev, struct svm_range *prange,
 	return 0;
 
 reserve_bo_failed:
-	kfree(svm_bo);
 	amdgpu_bo_unref(&bo);
+create_bo_failed:
+	dma_fence_put(&svm_bo->eviction_fence->base);
+	kfree(svm_bo);
 	prange->ttm_res = NULL;
 
 	return r;
@@ -2293,6 +2342,74 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
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
index 168c623f4477..f157be434cfa 100644
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
@@ -156,6 +160,7 @@ int svm_range_split_by_granularity(struct kfd_process *p, struct mm_struct *mm,
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
