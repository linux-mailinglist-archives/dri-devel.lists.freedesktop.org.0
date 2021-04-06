Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B40354A8A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6127B6E560;
	Tue,  6 Apr 2021 01:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A7E6E52A;
 Tue,  6 Apr 2021 01:47:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ug9j20wW6m2f4RxWzVle5r9DEoTKSIAZDvhKMiUCY7BmLoSyRnnpP9/8kPNo8vPdYAHsM1Hc985Jn1J7BqPRgTY9AGBvm0RjUTslu1mJSpImfZYwpGAksfuYDi5TwdDVX8/khJZYr2UGX9xJiv9A/PiwYjvBTwft9dbMJhmBJLoq4re0qZeeDdHnfImGK+FUw5yCJPTWkNZqtB1qHWvGNQlf+h85Ra53TStn/lhuB/RmZREz7BPPlGk6hkAhnsoWvmd6ovTyMewZBij4YL+HSeRrfJKGtlvIMy/A6ZZsgoXtCzsJywPZkS4I7byPWAfJt0sRfkDUbAgB4z15yyjuxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKaQX9GSNXxqvDQDgcF7RVAoOVluQTTYh5U8q0aEOxU=;
 b=YFVs7hl0RLRJLkB0/1yV28BjnZ2tutGwux63FyuXVRK8Hn25OW11MQomqr1jlC5Kta+zgmigyb0aAXXLtzYo93sn7jMl3tm7hKDveVl1Dx0ITFIGAk09YKHcUA82Wo9joB7IoXwbqN1a8ablqpKJxqQ++s1Rx2r776xjMMLnjwFopKFTPXQtKKfjEVdUWppQkOjzpVr2RB6dvI4dcBbzf8ek73FreBp+sGlJlqSty+GpetykyNxvepGoltYfTy5Ch+uO6Fj1XIgxgqCgMmHddj7Ae+knAxR+OBgEI0SHutuTQ7kxZlVXVe8R29tgUVXrbkEDsX73T+yMdCu9uNSJ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKaQX9GSNXxqvDQDgcF7RVAoOVluQTTYh5U8q0aEOxU=;
 b=Fuu+9bwE6zs+j+ERJOoIn6UcoGuaikkLvWg6QHw/UVNOZQ8vY5FwLUIOumjhVYn78taMWdve3+cKA4gfJt2qYE80xnAm83X3d2n+bzDPGexKHqh3wLMqln73Xid0x2Iq/JTUyeo2J0Ez4ETkL35Tm5mwR2djYsRF/O6jsiTMATI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4159.namprd12.prod.outlook.com (2603:10b6:208:1da::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 01:47:09 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:47:09 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 27/34] drm/amdkfd: add svm_bo eviction mechanism support
Date: Mon,  5 Apr 2021 21:46:22 -0400
Message-Id: <20210406014629.25141-28-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406014629.25141-1-Felix.Kuehling@amd.com>
References: <20210406014629.25141-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::10) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:47:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eef1d92e-97f0-4e0c-f5c6-08d8f89de3b8
X-MS-TrafficTypeDiagnostic: MN2PR12MB4159:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4159ABA0BEA615674D1DBD6D92769@MN2PR12MB4159.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EYUbNgtoeOEvdGjT9Or4b6tSptWZiTY5kKTjqZr13Nm03KOgc+aRHVLDyFGyX72cZTjcxzouMlPcpJsDdxtTlqPE5CyWkwpMV1a0MGKSmtzL594Weg7n2fKEH4LrrhStd4MZwJSYBN78t1CIvOZdkPYM/ozTIIyAUAXEPfhMywd+55gQKfHHenFn5XYJll+ZtY/Ef3dX8rytxuuITCAjM/TjKR3K+7NVu7ybFpGIeUA+y7Riwf/EsupeZYHaTRvKSaHMO6/KvVoe2CE5Aw8oVrNf74Hl9odp1tDDDZt+2p+2oe6EnMnObUeGshmorliua0bh+zoqfF+aJX0ncetqGZjlL2rNTEqN7Gf3L2A9s0wz9+RYvnHIxI/zPol0tN4SFdh8yBf/rzSCxxJj0khshpJ1iLBZfNgF+6Bq/IU3Z7Y8g7e+PB4xc+94KCeGdkZUHtl55c/vpMJpTzn+i6bavlKKIDY44XxpMYQMXJ3kAGt/0US6L0xsOcwZH2F4UEvU0PykAuBAc4ITq+w3N+wWYtEwnaZduHTXJxmIB1++FJKC4z59R8JLkB5lMN5ZSJTd3lDMek8EoYhCaXX/qOd4KJZHqYG0M8xO2qbLQTAyiSvuLcSCOu8ZO/QVYB43/Y5KoBcZs3dZ61pvKi/yJLJXjBUe8W3/OgIYM44q7Z0yIYIPuYbWNi3t1DmUhwnYq9R3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(66556008)(2906002)(66946007)(66476007)(5660300002)(8676002)(26005)(6666004)(186003)(8936002)(316002)(4326008)(83380400001)(478600001)(450100002)(52116002)(7696005)(54906003)(38100700001)(36756003)(2616005)(956004)(6486002)(16526019)(38350700001)(1076003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cr08tOPyzzok8LHuh4o4YY0ApUyRnYFpPwzAZ3cxpZMabLWlweeR3GbaRIMM?=
 =?us-ascii?Q?kNLW0vlyzGeIOM9E79Qky8H4t4dDW5SHms2RuhTHWBCIuJQ2qokLm46hSOax?=
 =?us-ascii?Q?00Gwigx+UP6SPX0ohuvDrcW0ch3A9PbCsZf3OSzWGq4m2izrcMhSQop4tlJ9?=
 =?us-ascii?Q?Oj/u5n2M+I869j5v61X0rNMaHaMdCtD4gRuwrkQezlizPJqttbqoXY4Ytt7B?=
 =?us-ascii?Q?mOd4mQVwJhqWZPLpQSAWfjjhEgrtjHGo3MBVlo0sAdnK65aDF9wFnIkpVQmv?=
 =?us-ascii?Q?uB9yqGH6au1cc5xzqnkSoQA2OQJ3s3xfMeVVhekFy8XpydFKSBb5vIcPzt2Y?=
 =?us-ascii?Q?ggboooOUub5OTwN3OBjjkSEPSdYHc2H7Wuq3i1Vp/IU0PfIJ90RMrCVX4qu9?=
 =?us-ascii?Q?KxnA2uA79dihrNFoobJCFYLAJ4gKUqTvWrR/tmWkdtyzZXs6dFf2XTwRs2Mj?=
 =?us-ascii?Q?ojYautlI17Tk7/sHa6kdEb4S9puRlPgWf0fRnPu0dADClDi/C0THHxSr4yQ/?=
 =?us-ascii?Q?rNZEevks4T7vqERLEKCeYO0GfsMzJ0ols1WdVLp87ihe0nRbq0KOIb+qdUkU?=
 =?us-ascii?Q?baX7Z17f0KYaMjrRROpUFH0VVRLbNqJq0TUN/+ZayjT9Q9x9eDG7ZM/B57Bi?=
 =?us-ascii?Q?/x+GIc2uctF5KlDunPe5OaFP0932owDuzUm0tt7ozaZ1bew8rK0uHfpW/Ddt?=
 =?us-ascii?Q?tApq584SBCIhWTswrUlPGAXwrsQ7AjGfwic+cYJ70wVdjWAtiDdBjgo+9xeq?=
 =?us-ascii?Q?h9Rs8KxvoP2b8pGYD09IifS33FkVSp/DglmuQ64I9x98LF8aAO+UTgW3Jkrz?=
 =?us-ascii?Q?Fu4OOpoXDlbyGCVndtGVsNEdniBYebni1j77tWL3/kgO1RcYR2WQeASkQEel?=
 =?us-ascii?Q?btL2IbfrebaNATDU/41qBIb5N3lXUgX4e50C98i/ytqLDxwZmnjMkNKTW4eN?=
 =?us-ascii?Q?upizGIiUfTZ750x3vxW1NA30UyQxvBmH0DKIpveYle9IOcGgbu0pHc0ImSAE?=
 =?us-ascii?Q?vd2co6E34bLXlhIU473GgSnzxIO3bVwaVOMFFqnCLCRij4zsIR4B6/4e8diV?=
 =?us-ascii?Q?HCS7x46CvusgWau6Mxok5YfumSv1+94TA3u+M9eBVscnfZYsKBGiVdimh62Y?=
 =?us-ascii?Q?CiAO2SKGwoUo7ZuPktwBGz2ykcqYBGCd5LxVng7ibueiS52Au45W6Aqn8rOc?=
 =?us-ascii?Q?S4wlW92OvUMU35aZJJVZkfmYl8/6M7oWZeSNSsIG9PNCrvbsrfUFWiDp3VLY?=
 =?us-ascii?Q?cmqjE6Nu90ULL60x0KGJkT7q3LFOuMPNfteuLWoSsuHCrVCbqyR6NPmhbpAM?=
 =?us-ascii?Q?DBS17p/JMRfq+ThQWhlRi3Zt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eef1d92e-97f0-4e0c-f5c6-08d8f89de3b8
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:47:08.9428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MMxVgAEAr9gWKnM5/zFp1HBgpLNxqN2oD8AKtti+XtESHR4tUDaYhEdxoz1U8DUOTKrUuFZbDx6IIUfFVyp53A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4159
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
index 1e5c4dfc9de3..adb8e69fbd28 100644
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
@@ -2333,6 +2382,74 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
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
