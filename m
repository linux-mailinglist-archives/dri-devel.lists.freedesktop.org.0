Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DF9350DA2
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13986EC25;
	Thu,  1 Apr 2021 04:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55F06EC25;
 Thu,  1 Apr 2021 04:22:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QkFqf16pYbbJr0N7jEtjL4lynwQUYbc7spDBWWwENvGfG5wp+9t0DcmFU3RF/o2AFIIu/Xjmkt4fohGDU3O58wAT4pNi9RmcuSIQE+jsjIYLdFeWK2qrBl56RFGTo8pb3fe9ZpookYIHQjmZA3hYR436pzgvGHdTYcqdV2NVboKXCk2VXjjALlSf7+IPgnWjMOyJZ0b8onTj5+ZDl8TY3NSvHUx+TW6LWwWNO8QfriK3v9D78YYE/4ivyppqQoTaZyNx0F89phFLQlGLRsx9l3iaKZThPIiQ1aWc8QnDZqprCX9iEcpO90HvAEpAXQauk1AWa80EDbO8NX5QY1r2Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKBVB5COff4ImNkDKYwKVBir4Jn7sSym9up4EYrHSQI=;
 b=KAbWhqxSSkT37EpvxqIdYkNNFgwqynvWp5e4WnqYmh+xi5w1sXlgp0Qo4B67ivuzMixGy/j6YlNdDS+VcPydCqe14my/BPD9mQ9+Vb2qbUghrpp4FfImUIK681CiGIsSXED0HFlg5blhDVsEpTd/bsK+OW5aVcT6BE3zC6Fu72ixZfRODYTbueDPQAP/DAVLr7B90DlU+snJwFPat9umS0r5XaoBKN6/wz5v65f5byJoW+tjyRREH//ayJGVg3zxodfTHV76vYsJeNkazRvg7r7EhOsRhkbJ5EHofhqwl8jLWP8Zb6O+2NocHcjfUAbEWklWCFXzqYMvckggjJEIOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKBVB5COff4ImNkDKYwKVBir4Jn7sSym9up4EYrHSQI=;
 b=WtQDPTmNyww4BSF4YrDPjX+UvW4WeOIBDViMqqrx9XlN3VkTvy+Gd0UC0DnQSl9R4PmWz3bjHtAYsUJAwsO53XgtFS8+c8PK2HJXHKufzXJtmGodQcYrRK5Nm3XmMGZ9NJ4ZMEzHsb3rl3DzHSTp+6xao/LGyDLKOjcBYJeauuk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4916.namprd12.prod.outlook.com (2603:10b6:208:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Thu, 1 Apr
 2021 04:22:47 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:22:47 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 05/34] drm/amdgpu: add common HMM get pages function
Date: Thu,  1 Apr 2021 00:21:59 -0400
Message-Id: <20210401042228.1423-6-Felix.Kuehling@amd.com>
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
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:22:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 457fe4eb-ad88-4e13-b9c1-08d8f4c5cd27
X-MS-TrafficTypeDiagnostic: BL0PR12MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB491657AE9124369E9D6B97E6927B9@BL0PR12MB4916.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dUvkJuLpoMy/2NTktnBVdJucLmzAOs7qSFP8aqw6cEmk0Ni3/zW/eLWoU3TjiDRmaLJOYtXkW6NjwpZ0TxkMYyBCqcRviPiP/Rcpn+2xFVJT7f9HUBPtTXiVbidIDZAnAH+DDIP/fRu3T9V5gwVmWe94nRf/kO3cNaCp+Fpsu5f5PnZXFh/sqOC5F8Br9SMxmi6xptV/SrljuB9Dyq1UB4nQDQ0zd54DWjyCjGdZY9r1X9EKKxQx8XkhAo06ZQadswVCJvhq/oLEIX4rXrORzoUmnGyG41anXoCcgbadRwbXoxwUakiDsSgicU3L/uJL+uLtBwb2bQrEDTE7H1W11k8krBcPrGPmjtkydaobWdaLYqBoslbFcT3IEMl+eygcf9RkLOGpL2L1AOd+m0Yr4PldQe5oNvB0UCc//mh0JOAq1TTmsd0zWAeZmy7cJkupehjT9u/mLRR8MZYppRSstgDdoDo+Hc0Kll6QiwyBC0AvtJAFGXn0tFWJrrVF4XPz7Gtp+NqdJI+F7Vlrx9XCEDHtxMHJj3Gu/+7peASp1mTbwwaFgZ7idu0XEkHUzmzIEczg8ZJyefdWnZKgeFjvd1xk+uhPUQEb4YFQvvWJDg3za4nCq/wA5LnvV9PVYHHFhDhT5y4ylIUEPD1JYTwPhaGF83VacE7Tvm0L9EK+u3U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(5660300002)(478600001)(36756003)(16526019)(186003)(1076003)(316002)(6486002)(66946007)(956004)(66556008)(26005)(83380400001)(8676002)(8936002)(450100002)(38100700001)(4326008)(52116002)(7696005)(2616005)(2906002)(66476007)(6666004)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Ipmn8TjwpfC/P+TMcEpKKB0XI8eN1P/wYN9HtbGOqXRyHQdpytylDUS56Tb8?=
 =?us-ascii?Q?OcHeKde/9G9Sr/K3uP+vI0Uza7wev6YF+PD67HKHDu5APgEzOrJ6nZ/EobCE?=
 =?us-ascii?Q?gPC7SC1K86LOVuf2bCv8Bu4qcPpmCvh37xO6E48zlU63rnYvsjI0Uxwta+s9?=
 =?us-ascii?Q?MIY/FFV/TTp23JOXtzomojw2+JAUrO3p3TzZ4AthI0qaDTX2mqQbPG502APy?=
 =?us-ascii?Q?7MLQD3I4pkKcLfM3YtBLoMATtWly4Iiz8lSxav/gPBNjntf7kMSBgdCCh9+x?=
 =?us-ascii?Q?g9TIFpColZSzhwYz/KrHPNMQuwrFhWcnYanxUSqA8NBRR60q+hKTAc3OwDYt?=
 =?us-ascii?Q?FUify215xdKKGN3Q09AIvWfEpjMUVjs8e98z0lJ7uJD2hiNG5jyJE+5aqLN4?=
 =?us-ascii?Q?xwlg3geN8klQ7K7+l0fJZyX//qfwZo+Sjx3C+AK8pfyjBHOLu/Kl2zzJ6MgJ?=
 =?us-ascii?Q?vX15tnIyq/QYzzM1huGPUyoejtS9NMVIH1ACXEPk7QaDaqX2SmryWszs1RGV?=
 =?us-ascii?Q?20pzw8IYZLNsZAr9C3NRNEzBmGFS6d8LsvmoO3yhNWUkE0OPjUoVQhnn2kAM?=
 =?us-ascii?Q?Ar3o4qP3v30bCKCnX3udd4h/Ljc5SrYfA6MEnZZOwGmpLPSkS/h27H0n8jiG?=
 =?us-ascii?Q?mMe3kKx/elKKIU9ZlROywQO5cKEAHyMMm8mirbBSOwUQXQOzgdwCiC/XPpam?=
 =?us-ascii?Q?IY712ZAGIWPKJC57YyfUpd80U00+URrMYjJGfGgqA/JDtBbSi2RAKSqdZNdc?=
 =?us-ascii?Q?6vBs2CoF9zNvwEgr/u/5JukwVScmLJtTURoND34od3mPv7Xtn6KghvqIisZh?=
 =?us-ascii?Q?kNqnkI5ohRjMKChiQJZiQQpk1EJJT6KRrnFDdiGmvBLsrUeKFDTXNbapeBNL?=
 =?us-ascii?Q?motcXQyv/473uNBCiWGgUYFRmVUHXOoKl4M4V+tlL7tCWSvVhGpGJcAnciXi?=
 =?us-ascii?Q?hZtFlAnC9xQyNs4qRiBecosOKe/7RCJJ/Jmmjg3wfHXFLaoSmphpQaLXLuT7?=
 =?us-ascii?Q?M7wn3Q6xILu5BUR8cBJPEF0vqW3cm3G8Zups1tQo5Vs83D40hVoZs0qii4zo?=
 =?us-ascii?Q?QMm6WhNS79Mr2WUPvPPlhq4XbJKWdY5e8LBIjARYSQr0Q/JAlgfxCBcSVbSz?=
 =?us-ascii?Q?ZADAF091hEyk2qn2W16zmAZaYBkJgj4MOR14MxqABUbv1YxyjcjQMxYaG/RS?=
 =?us-ascii?Q?xGQ5pfOgSHmirAlPlUY1ZuDqVWJfQ5rtQH2TDc/0C0KsKJyni5N9rWtZGpx3?=
 =?us-ascii?Q?v/xfDHFiEGhrl9yTDW5MILCQzaDTrVkHCVUpCs+npCh3gIGNS1V1JNi7Vik/?=
 =?us-ascii?Q?3kgxfY7DQ2jiMDroojsQDiWE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 457fe4eb-ad88-4e13-b9c1-08d8f4c5cd27
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:22:46.5720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 67FkDU/fIXIp2AgjjylGWDTt5N/OgPS6Ffod4/8BONjbJkkELhIfYtj5e2vpZ/YJhzURInaeWl7WPVRd+/cYHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4916
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
Cc: Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

Move the HMM get pages function from amdgpu_ttm and to amdgpu_mn. This
common function will be used by new svm APIs.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  | 83 +++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h  |  7 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 76 +++-------------------
 3 files changed, 100 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
index 828b5167ff12..997da4237a10 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
@@ -155,3 +155,86 @@ void amdgpu_mn_unregister(struct amdgpu_bo *bo)
 	mmu_interval_notifier_remove(&bo->notifier);
 	bo->notifier.mm = NULL;
 }
+
+int amdgpu_hmm_range_get_pages(struct mmu_interval_notifier *notifier,
+			       struct mm_struct *mm, struct page **pages,
+			       uint64_t start, uint64_t npages,
+			       struct hmm_range **phmm_range, bool readonly,
+			       bool mmap_locked)
+{
+	struct hmm_range *hmm_range;
+	unsigned long timeout;
+	unsigned long i;
+	unsigned long *pfns;
+	int r = 0;
+
+	hmm_range = kzalloc(sizeof(*hmm_range), GFP_KERNEL);
+	if (unlikely(!hmm_range))
+		return -ENOMEM;
+
+	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
+	if (unlikely(!pfns)) {
+		r = -ENOMEM;
+		goto out_free_range;
+	}
+
+	hmm_range->notifier = notifier;
+	hmm_range->default_flags = HMM_PFN_REQ_FAULT;
+	if (!readonly)
+		hmm_range->default_flags |= HMM_PFN_REQ_WRITE;
+	hmm_range->hmm_pfns = pfns;
+	hmm_range->start = start;
+	hmm_range->end = start + npages * PAGE_SIZE;
+	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+
+retry:
+	hmm_range->notifier_seq = mmu_interval_read_begin(notifier);
+
+	if (likely(!mmap_locked))
+		mmap_read_lock(mm);
+
+	r = hmm_range_fault(hmm_range);
+
+	if (likely(!mmap_locked))
+		mmap_read_unlock(mm);
+	if (unlikely(r)) {
+		/*
+		 * FIXME: This timeout should encompass the retry from
+		 * mmu_interval_read_retry() as well.
+		 */
+		if (r == -EBUSY && !time_after(jiffies, timeout))
+			goto retry;
+		goto out_free_pfns;
+	}
+
+	/*
+	 * Due to default_flags, all pages are HMM_PFN_VALID or
+	 * hmm_range_fault() fails. FIXME: The pages cannot be touched outside
+	 * the notifier_lock, and mmu_interval_read_retry() must be done first.
+	 */
+	for (i = 0; pages && i < npages; i++)
+		pages[i] = hmm_pfn_to_page(pfns[i]);
+
+	*phmm_range = hmm_range;
+
+	return 0;
+
+out_free_pfns:
+	kvfree(pfns);
+out_free_range:
+	kfree(hmm_range);
+
+	return r;
+}
+
+int amdgpu_hmm_range_get_pages_done(struct hmm_range *hmm_range)
+{
+	int r;
+
+	r = mmu_interval_read_retry(hmm_range->notifier,
+				    hmm_range->notifier_seq);
+	kvfree(hmm_range->hmm_pfns);
+	kfree(hmm_range);
+
+	return r;
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h
index a292238f75eb..7f7d37a457c3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h
@@ -30,6 +30,13 @@
 #include <linux/workqueue.h>
 #include <linux/interval_tree.h>
 
+int amdgpu_hmm_range_get_pages(struct mmu_interval_notifier *notifier,
+			       struct mm_struct *mm, struct page **pages,
+			       uint64_t start, uint64_t npages,
+			       struct hmm_range **phmm_range, bool readonly,
+			       bool mmap_locked);
+int amdgpu_hmm_range_get_pages_done(struct hmm_range *hmm_range);
+
 #if defined(CONFIG_HMM_MIRROR)
 int amdgpu_mn_register(struct amdgpu_bo *bo, unsigned long addr);
 void amdgpu_mn_unregister(struct amdgpu_bo *bo);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 41a4c456961c..a2585058e65d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -32,7 +32,6 @@
 
 #include <linux/dma-mapping.h>
 #include <linux/iommu.h>
-#include <linux/hmm.h>
 #include <linux/pagemap.h>
 #include <linux/sched/task.h>
 #include <linux/sched/mm.h>
@@ -670,10 +669,8 @@ int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **pages)
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
 	unsigned long start = gtt->userptr;
 	struct vm_area_struct *vma;
-	struct hmm_range *range;
-	unsigned long timeout;
 	struct mm_struct *mm;
-	unsigned long i;
+	bool readonly;
 	int r = 0;
 
 	mm = bo->notifier.mm;
@@ -689,76 +686,26 @@ int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **pages)
 	if (!mmget_not_zero(mm)) /* Happens during process shutdown */
 		return -ESRCH;
 
-	range = kzalloc(sizeof(*range), GFP_KERNEL);
-	if (unlikely(!range)) {
-		r = -ENOMEM;
-		goto out;
-	}
-	range->notifier = &bo->notifier;
-	range->start = bo->notifier.interval_tree.start;
-	range->end = bo->notifier.interval_tree.last + 1;
-	range->default_flags = HMM_PFN_REQ_FAULT;
-	if (!amdgpu_ttm_tt_is_readonly(ttm))
-		range->default_flags |= HMM_PFN_REQ_WRITE;
-
-	range->hmm_pfns = kvmalloc_array(ttm->num_pages,
-					 sizeof(*range->hmm_pfns), GFP_KERNEL);
-	if (unlikely(!range->hmm_pfns)) {
-		r = -ENOMEM;
-		goto out_free_ranges;
-	}
-
 	mmap_read_lock(mm);
 	vma = find_vma(mm, start);
+	mmap_read_unlock(mm);
 	if (unlikely(!vma || start < vma->vm_start)) {
 		r = -EFAULT;
-		goto out_unlock;
+		goto out_putmm;
 	}
 	if (unlikely((gtt->userflags & AMDGPU_GEM_USERPTR_ANONONLY) &&
 		vma->vm_file)) {
 		r = -EPERM;
-		goto out_unlock;
-	}
-	mmap_read_unlock(mm);
-	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
-
-retry:
-	range->notifier_seq = mmu_interval_read_begin(&bo->notifier);
-
-	mmap_read_lock(mm);
-	r = hmm_range_fault(range);
-	mmap_read_unlock(mm);
-	if (unlikely(r)) {
-		/*
-		 * FIXME: This timeout should encompass the retry from
-		 * mmu_interval_read_retry() as well.
-		 */
-		if (r == -EBUSY && !time_after(jiffies, timeout))
-			goto retry;
-		goto out_free_pfns;
+		goto out_putmm;
 	}
 
-	/*
-	 * Due to default_flags, all pages are HMM_PFN_VALID or
-	 * hmm_range_fault() fails. FIXME: The pages cannot be touched outside
-	 * the notifier_lock, and mmu_interval_read_retry() must be done first.
-	 */
-	for (i = 0; i < ttm->num_pages; i++)
-		pages[i] = hmm_pfn_to_page(range->hmm_pfns[i]);
-
-	gtt->range = range;
+	readonly = amdgpu_ttm_tt_is_readonly(ttm);
+	r = amdgpu_hmm_range_get_pages(&bo->notifier, mm, pages, start,
+				       ttm->num_pages, &gtt->range, readonly,
+				       false);
+out_putmm:
 	mmput(mm);
 
-	return 0;
-
-out_unlock:
-	mmap_read_unlock(mm);
-out_free_pfns:
-	kvfree(range->hmm_pfns);
-out_free_ranges:
-	kfree(range);
-out:
-	mmput(mm);
 	return r;
 }
 
@@ -787,10 +734,7 @@ bool amdgpu_ttm_tt_get_user_pages_done(struct ttm_tt *ttm)
 		 * FIXME: Must always hold notifier_lock for this, and must
 		 * not ignore the return code.
 		 */
-		r = mmu_interval_read_retry(gtt->range->notifier,
-					 gtt->range->notifier_seq);
-		kvfree(gtt->range->hmm_pfns);
-		kfree(gtt->range);
+		r = amdgpu_hmm_range_get_pages_done(gtt->range);
 		gtt->range = NULL;
 	}
 
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
