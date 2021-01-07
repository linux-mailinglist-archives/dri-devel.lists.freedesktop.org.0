Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F222EC8AD
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:03:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75BF6E402;
	Thu,  7 Jan 2021 03:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D5C6E430;
 Thu,  7 Jan 2021 03:03:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YcQoMyeGadCEo0xZQWLvVQ7HcVZ5tpH+7On4y6/kBEmmdA4nKGiOnkpgIIj7VFYwLZ5aKhcRKuEyQqDUYaTeuJMvWNnEQKhDEfcbJrEASKH7o6FkGVVj7T/FG36LRQkhmB4g0jCrRaKMobwB6rk9qJXkpSFvcPa6nLC7TmY7lcRBVAJCPzeWbIuHdDVm2zPk9zADE/4pCxJRYxkPbHMOTSdMJekQ3rfq7i/d9RY985knFzts+ETak2qngKZ+JrJsHT4kDEvHyUuPmm5uDtX00ygRmkGR36HgmpcgbTzbMu2QcIrouPSy5UlVZ5zq7ph7bZxqfr9jRNPqZroxRFDUDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuOKBcq0mp1yweM01MCmH35dnrk8H2U6PrYHUrpH5/g=;
 b=lVaMD2ZGQdsznsXBPrfGjK44Yms1sy92+Ap4/iHujxry9Xw5Z1LI54hVOSBdf/Gp6QTXIkktkIDlWHKc8SPcds2eOntP+mQ0ldRr5r+SJHtwp8DlHyiybLZjhaQw9B2wkoonhb+rQEwESvm9TACufotmtEpoOS+9c/qRkvqUVcdGbtQn2QHH8lduqPuFoAG3BD1gnrFt3Uytl0bcNOURc1TTfiONffi1hep2ywA2LmjEp9+XCQmAX/faHNYYi8TcMvVWmMuF18WMduWrY0Y9BLZ3mBEDsoA0FCaPBFLM7pB6v/TbNDQLgVghJ4Hlpm/0j2dV8FZIEtJwwR1MqFd67w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuOKBcq0mp1yweM01MCmH35dnrk8H2U6PrYHUrpH5/g=;
 b=nbOPzZYirwdDEnBoDPi5MlbwNkIIKvRYBT+aA8BxVlVrZ28h++lIvKF6Muqzgm5vHRuYIj6yFKaVGDNMc78hu+a/v4L+cDALVM9IRG9DtGZtnUtzsJ8pwpu+hy/RZ3RerC9DLXJ5+1yP02SMEeLPQ1yGFk8A7t4B5Ck+T5u7I9Q=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 03:03:04 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:03:04 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 28/35] drm/amdkfd: add svm_bo eviction mechanism support
Date: Wed,  6 Jan 2021 22:01:20 -0500
Message-Id: <20210107030127.20393-29-Felix.Kuehling@amd.com>
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
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:03:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0fbbc1e5-bb8f-4933-0e5c-08d8b2b8c06b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB440862B160B3DB5FEC4C610092AF0@MN2PR12MB4408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eE2+MtOawB430rqHEPgxIIrOacKABFH69WuauqhyCZEv4Iz4AFBTEz+kDI2ISlVVfjswMv9g0FjmQI8coHZeWZ4T1DUvQIpIvPhsFwblRO8kWE4e8QVzc27gEq/hr85KfAUpdOj+A4Qg2yWwPzxRPTURmymAAXEVPgksP2urKYq+iamrO6+qeDy47Wcp83Auif9UGdVbPcce0cHnd1mSlnmT5FbWW+Dj3NWkhBfPMsIii2c7YFc/696w0c5aY620d6d9wAWrS5u7XSxpYb2KGNoCS5PIuqBFmqbBY4LibSEBEkQaWPgv025dcsDteK1lbxTZojPb7zjbvZ2Dkd52FDNrA0p89d0A1fA39oBQD+5ALhjS6IFSlkgYrOPN6VN7rOJqGdez3hzAt4bxfEnLOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(8676002)(2906002)(86362001)(450100002)(66556008)(4326008)(66476007)(8936002)(30864003)(5660300002)(66946007)(1076003)(6486002)(83380400001)(52116002)(316002)(7696005)(2616005)(36756003)(16526019)(956004)(478600001)(26005)(6666004)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?XzsGHeMSK8+4v8IzEIy0eJHmd0E9cxKykwPTV6RqPpQdXaSgZD573qY7zz1o?=
 =?us-ascii?Q?IoHcxtfxK5pu4Qv52YopebR7Nz3Uf3sKKjHvTjjuJvs3N1rlaKrZ1mZasIkm?=
 =?us-ascii?Q?95nIcWByJQQxu7M0+DWKbCpisRQ2sgQHUsWrLkyVPKSudXS79/iMBwGUDHmR?=
 =?us-ascii?Q?m5ojdkuSM8aisl6r1acfCK1osqXgD6M/lbChKcivAOH4vLHyQz+DUKyvuhjl?=
 =?us-ascii?Q?37FORD+2hecItyHf+gfBB9A1mwVXLy7ptjZH+iTJ4mFQ0FHAdftThhm3SCPY?=
 =?us-ascii?Q?4yrH5dvcNFn6P11t3iEmpUbSHNq4ZdFegdyCbhQNbrn1OcuTt0ROGBrYq1Jr?=
 =?us-ascii?Q?vKUiMWRCtpxqKRU2596+vtDKtuHKH5ncS6UlkZeiG8Tv/S1JyTI8iqMX2unZ?=
 =?us-ascii?Q?CDWLOmjVNwPNmFZNyZO3tcm17Fd6lnPKacnAPlcHlurDPZvoMqCUVMbin7Pu?=
 =?us-ascii?Q?AiIIq4aCsLkuY3tkll9YoKN5HzV9ygTIt1Mqyyw+WL8TgHU5Q8GhWUhcqiSD?=
 =?us-ascii?Q?GFWrRT9wfswn4gJSIu1UHVVhBIQu/ZsAcmHOuZry/TItBoBqnoXhPWXT/wIq?=
 =?us-ascii?Q?k/siSDfCEqmqiT0Nh8kyIrmo8/NOAuvA9cio7Zt8rStfVvzCjlaj0R7WH6oJ?=
 =?us-ascii?Q?RsPXr6xOQO8D2VRGsNM1LsuCZ+Ru8PYcv2sbieggxSCSbDvQgxSk/nVaUgex?=
 =?us-ascii?Q?/Ph602Nd6QWCcAUvwSVKNqduixAY63dNxtylYCjE+ibbjPyueeI0XgYrbtgj?=
 =?us-ascii?Q?v4Yf57LdgJDa45nNFAXM4IRorkwFTs5CgzTiDuVj6FCINb75IwKkEwWMFNI7?=
 =?us-ascii?Q?mqUWN28YuOnMx7VxuHHSH2oQdzxzA+94VNF4Sbk1w6RnPN2URWAcydWEn0GH?=
 =?us-ascii?Q?w5dKCTQcO11ulKzclwQ+DwQEsIMrSpR7UVEWs8q83nTOBfmBVDlw3Vuz6Hl3?=
 =?us-ascii?Q?xEzJTjMyaag/RCpSm9s/7DTm8C88AToX1/ZEzzf3gzVoly8dSvziS4GbWMty?=
 =?us-ascii?Q?yT5y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:03:04.3628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fbbc1e5-bb8f-4933-0e5c-08d8b2b8c06b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H3sDUWgbobsOXUck2wK3Fafqan1WXh/M5QaxP64mrs2xCVJqZI5VpZCX1hDuQz0MsCkkCVNjLIpuzoVAko8bhQ==
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

From: Alex Sierra <alex.sierra@amd.com>

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
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 197 ++++++++++++++++++++-------
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h |  13 +-
 2 files changed, 160 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 7346255f7c27..63b745a06740 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -34,6 +34,7 @@
 
 #define AMDGPU_SVM_RANGE_RESTORE_DELAY_MS 1
 
+static void svm_range_evict_svm_bo_worker(struct work_struct *work);
 /**
  * svm_range_unlink - unlink svm_range from lists and interval tree
  * @prange: svm range structure to be removed
@@ -260,7 +261,15 @@ static void svm_range_bo_release(struct kref *kref)
 		list_del_init(&prange->svm_bo_list);
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
@@ -273,6 +282,62 @@ static void svm_range_bo_unref(struct svm_range_bo *svm_bo)
 	kref_put(&svm_bo->kref, svm_range_bo_release);
 }
 
+static bool svm_range_validate_svm_bo(struct svm_range *prange)
+{
+	spin_lock(&prange->svm_bo_lock);
+	if (!prange->svm_bo) {
+		spin_unlock(&prange->svm_bo_lock);
+		return false;
+	}
+	if (prange->mm_nodes) {
+		/* We still have a reference, all is well */
+		spin_unlock(&prange->svm_bo_lock);
+		return true;
+	}
+	if (svm_bo_ref_unless_zero(prange->svm_bo)) {
+		if (READ_ONCE(prange->svm_bo->evicting)) {
+			struct dma_fence *f;
+			struct svm_range_bo *svm_bo;
+			/* The BO is getting evicted,
+			 * we need to get a new one
+			 */
+			spin_unlock(&prange->svm_bo_lock);
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
+			spin_unlock(&prange->svm_bo_lock);
+			pr_debug("reuse old bo svms 0x%p [0x%lx 0x%lx]\n",
+				 prange->svms, prange->it_node.start,
+				 prange->it_node.last);
+
+			prange->mm_nodes = prange->svm_bo->bo->tbo.mem.mm_node;
+			return true;
+		}
+
+	} else {
+		spin_unlock(&prange->svm_bo_lock);
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
@@ -292,71 +357,54 @@ int
 svm_range_vram_node_new(struct amdgpu_device *adev, struct svm_range *prange,
 			bool clear)
 {
-	struct amdkfd_process_info *process_info;
 	struct amdgpu_bo_param bp;
 	struct svm_range_bo *svm_bo;
 	struct amdgpu_bo *bo;
 	struct kfd_process *p;
+	struct mm_struct *mm;
 	int r;
 
-	pr_debug("[0x%lx 0x%lx]\n", prange->it_node.start,
-		 prange->it_node.last);
-	spin_lock(&prange->svm_bo_lock);
-	if (prange->svm_bo) {
-		if (prange->mm_nodes) {
-			/* We still have a reference, all is well */
-			spin_unlock(&prange->svm_bo_lock);
-			return 0;
-		}
-		if (svm_bo_ref_unless_zero(prange->svm_bo)) {
-			/* The BO was still around and we got
-			 * a new reference to it
-			 */
-			spin_unlock(&prange->svm_bo_lock);
-			pr_debug("reuse old bo [0x%lx 0x%lx]\n",
-				prange->it_node.start, prange->it_node.last);
-
-			prange->mm_nodes = prange->svm_bo->bo->tbo.mem.mm_node;
-			return 0;
-		}
-
-		spin_unlock(&prange->svm_bo_lock);
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
+		 prange->it_node.start, prange->it_node.last);
 
-	} else {
-		spin_unlock(&prange->svm_bo_lock);
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
 
 	r = amdgpu_bo_create(adev, &bp, &bo);
 	if (r) {
 		pr_debug("failed %d to create bo\n", r);
-		kfree(svm_bo);
-		return r;
+		goto create_bo_failed;
 	}
-
-	p = container_of(prange->svms, struct kfd_process, svms);
 	r = amdgpu_bo_reserve(bo, true);
 	if (r) {
 		pr_debug("failed %d to reserve bo\n", r);
@@ -369,8 +417,7 @@ svm_range_vram_node_new(struct amdgpu_device *adev, struct svm_range *prange,
 		amdgpu_bo_unreserve(bo);
 		goto reserve_bo_failed;
 	}
-	process_info = p->kgd_process_info;
-	amdgpu_bo_fence(bo, &process_info->eviction_fence->base, true);
+	amdgpu_bo_fence(bo, &svm_bo->eviction_fence->base, true);
 
 	amdgpu_bo_unreserve(bo);
 
@@ -380,14 +427,16 @@ svm_range_vram_node_new(struct amdgpu_device *adev, struct svm_range *prange,
 	prange->offset = 0;
 
 	spin_lock(&svm_bo->list_lock);
-	list_add(&prange->svm_bo_list, &svm_bo->range_list);
+	list_add_rcu(&prange->svm_bo_list, &svm_bo->range_list);
 	spin_unlock(&svm_bo->list_lock);
 
 	return 0;
 
 reserve_bo_failed:
-	kfree(svm_bo);
 	amdgpu_bo_unref(&bo);
+create_bo_failed:
+	dma_fence_put(&svm_bo->eviction_fence->base);
+	kfree(svm_bo);
 	prange->mm_nodes = NULL;
 
 	return r;
@@ -621,7 +670,7 @@ svm_range_split_nodes(struct svm_range *new, struct svm_range *old,
 	new->mm_nodes = old->mm_nodes;
 
 	spin_lock(&new->svm_bo->list_lock);
-	list_add(&new->svm_bo_list, &new->svm_bo->range_list);
+	list_add_rcu(&new->svm_bo_list, &new->svm_bo->range_list);
 	spin_unlock(&new->svm_bo->list_lock);
 
 	return 0;
@@ -1353,7 +1402,7 @@ struct svm_range *svm_range_clone(struct svm_range *old)
 		new->offset = old->offset;
 		new->svm_bo = svm_range_bo_ref(old->svm_bo);
 		spin_lock(&new->svm_bo->list_lock);
-		list_add(&new->svm_bo_list, &new->svm_bo->range_list);
+		list_add_rcu(&new->svm_bo_list, &new->svm_bo->range_list);
 		spin_unlock(&new->svm_bo->list_lock);
 	}
 	new->flags = old->flags;
@@ -1964,6 +2013,62 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
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
+	int srcu_idx;
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
+	srcu_idx = srcu_read_lock(&svm_bo->svms->srcu);
+	list_for_each_entry_rcu(prange, &svm_bo->range_list, svm_bo_list) {
+		pr_debug("svms 0x%p [0x%lx 0x%lx]\n", prange->svms,
+			 prange->it_node.start, prange->it_node.last);
+		mutex_lock(&prange->mutex);
+		svm_migrate_vram_to_ram(prange, svm_bo->eviction_fence->mm);
+		mutex_unlock(&prange->mutex);
+	}
+	srcu_read_unlock(&svm_bo->svms->srcu, srcu_idx);
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
index e546f36ef709..143573621956 100644
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
 /**
  * struct svm_range - shared virtual memory range
@@ -123,5 +127,6 @@ int svm_range_split_by_granularity(struct kfd_process *p, unsigned long addr,
 				   struct list_head *list);
 int svm_range_restore_pages(struct amdgpu_device *adev,
 			    unsigned int pasid, uint64_t addr);
+int svm_range_schedule_evict_svm_bo(struct amdgpu_amdkfd_fence *fence);
 
 #endif /* KFD_SVM_H_ */
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
