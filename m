Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DEF35FF46
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0576E993;
	Thu, 15 Apr 2021 01:24:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E266E98F;
 Thu, 15 Apr 2021 01:24:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qo7mCYRRf9E7js0AAH0kLRBCguFYxrFyPSUnbbuiIEe4WgmcTPDKk0/S4pgxvgSA93neRl7d4cP2NTz0hlfdoXnOKZ4FT7Ouaj3XevnfHzXZ6USjwJM5X94htws7Kjr/nzvVDkiwIfq0olW0F4LY8c+AApjdCEsyQ9MGKBOomjzorUOeFWsH8i7bR5378hhCqTXgELwC9Ac8BvT9ZiJjgSzb+BnyY9BuMvxmQa/C26xiQG1ZHRkJCaZ0GyrQGQO7aTinyTyHmmsAonPMSCVCogEA/ZyNqXIZkawuWE553josS5TQzxqtQWpxorzOwyMGr05Q66JFE6pq2mOd6G9SCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUvpEw1mLkW+Jcxtwd6Hi28FAn+ImYDiTc6PZq2gHl0=;
 b=VRg0VdAk7IMT+iNJRq50zeDnTBeVPmQPsw8CJnXHD5ptrW+c4sYkV9UqzJaTcYRRKfhVmyrGCewn6wXXuPO5jeYkswB7UJgQECYuynolm+fzudEmnLXH0hRtwAcGcykiCDTT/6sjQxsbLKsPbT/SDqRYNmq7asDgOqzq+pdajuvl3LOJkYE4fL0WS41TiYEcJbY4A92f4NipmvIoGkVy1cYYn7PWbQVF8AKCHBGAwC5QpgT4JFKF81SvFpZrM7JBfhl5BvebeGCrkoVlBAjlr1Bbe/mTzxckyN6Ll00kUt7WqcXbqi1mzQc/6BF44d1PgmZ8mNDad8wgbqFJ/qGMdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUvpEw1mLkW+Jcxtwd6Hi28FAn+ImYDiTc6PZq2gHl0=;
 b=2ErNBuU3n8S4ggJvj4rycUkrBpIgjJjetgpzKrQM1pGvjfefWoy03W2pxxacjjfHmWs30Y+rDxATWMczRZUN7PJ9zyA9QrMwjO/jTqjGZd6LTs/KfFd1q4MJqb+i4lcAOUvSxklArfialXtYvHJhhF+k+7FRw255EWosNF98TDk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3839.namprd12.prod.outlook.com (2603:10b6:208:168::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Thu, 15 Apr
 2021 01:23:58 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:23:57 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 05/34] drm/amdgpu: add common HMM get pages function
Date: Wed, 14 Apr 2021 21:23:08 -0400
Message-Id: <20210415012337.1755-6-Felix.Kuehling@amd.com>
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
 Transport; Thu, 15 Apr 2021 01:23:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c189ffda-74c2-4a89-26ae-08d8ffad240a
X-MS-TrafficTypeDiagnostic: MN2PR12MB3839:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3839AA5F5A681512BB7BDFF2924D9@MN2PR12MB3839.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pY1gSwDAUNTabcKooPY0SthPqtoPtZzaRouTnCqjM4K+HJ429Mb/ebcGqzeRo1FpDixzatZ0UQxgBMYqEuHk++qFwvuFLTGjVhaDn6OEj420b4k2JWnvsEM6g3/WK9UBe3zx3agTY+BLTqmcDdomZOGtOrDQzDEDNZh+zs5ePSXoRtYn7Yo0orE2iIFLlDvH8/O2lS+7zz77wkZq/XV0cL4PqMsu6uCXeI4upAooXbsOBS9w39RkrCYm2cWk7dm4YZdK5ixfnIV8/tkJMbqNmpyfNcn18HOwhhJz2Zuk291R94x6AxRn0kl/HViOq5lbprygG7pqx05fA6D+w6nItFZgMTCsOy5xHYGwC7xQEiUnpNK86DAZJcVfTqbaN4FAr4bRBZKzH2Qv5LN+/ZEu8yt3xRTQNhAPWa+PPqhGsgOG9xsPCKbgooJhJUJAlFbvi5w3q6kUykonwGGpkSSfMM2vRxuJDJ4YmHUlbd13iYhJOmjwhc5XDrs3QR5nK/kI45/gT54wKblPaXtY7d47/ix7M5eOaio76ofQWjS+ImgQIET5Mqg9uICOZfGLzHVmGo7chaOBO7WQ4jhJHR7FPfWdKZv7+gMahcDFAET6g9cAL8pLOfm/4MtJrb5QSX+wUQttPzUmC/alrdXCpYxmeSFX4qan3l1DswqXjR1B1oE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(2616005)(86362001)(26005)(956004)(52116002)(8676002)(316002)(83380400001)(4326008)(5660300002)(38100700002)(38350700002)(6666004)(478600001)(450100002)(8936002)(7696005)(66476007)(6486002)(66556008)(36756003)(66946007)(2906002)(1076003)(16526019)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?WAtwCJLZDV7NxWb8GCl943cCZ82JMN5px/EmwbNfRNQ0WFUKldUoIY7oGaI4?=
 =?us-ascii?Q?g8SplAolNJG7VFdEry4a8MkwHxAT0L+q9QCsYh6FiYDyiy6J4ZZlEeCbb8PW?=
 =?us-ascii?Q?sdaDrkjOMyE8KOEd5zYrIkJmJWj+W+ljWDORkXwtrZfP30nxNIhe81AtuSi5?=
 =?us-ascii?Q?kgR90dLv5Wo2uo9z2EEkYZMCCcL82p/Pjpp16qkHEZFtxggxXz/FzPZKi8WK?=
 =?us-ascii?Q?lXBCV8aHkMfQP78Tdj0gD6L0tKN2aGJQHhTXShFtjyAqpY7qZFCo6OnK/I/o?=
 =?us-ascii?Q?WR8EU3W6H7Ry+Q8F0W8KyZclt4Z7KikI5Cca+MPHj6pJQsr++RMbfGUSkQ9E?=
 =?us-ascii?Q?PcMtnTbCnHy5Z8F31FFbbNGiAqpSPvscJv3GubhfuD6F7Q77mB1J3Dj/M+ir?=
 =?us-ascii?Q?6t7luCLkH5JDkemCj7z0VidDzG8PuqpkxtiYjty74/tiCpyJOZL9qH+hDgc3?=
 =?us-ascii?Q?bBL+iLIu1IMUg/ZG1oVb+rP3+PsrOreMfsg8AyMWNuuMnPQrOT+EFc/NCN5m?=
 =?us-ascii?Q?RO20/HI1jLpUHVpXeIkrH35ymHUdI1LynTlj7F4VPRye9I2EPfJB+/AxAVa2?=
 =?us-ascii?Q?USD6WiH5d4xom2RER0g7O+Ox5xxiUYmga9VN55owvsgrSuZwmXkgn1KLHnor?=
 =?us-ascii?Q?F4nXTRuRKkQkGrpQxTuBbE6XcWSbkXT4NeobypJn0B4KqDenf+XcdZdjF8+S?=
 =?us-ascii?Q?M6KNQZcyRrKBgwrjg1GAGn2TYz8nVbCBCkPnMfMMZtcJMoEpNVOxIIVS370q?=
 =?us-ascii?Q?tmDx6sBfJs2huVSDwnGUpUPbDVWwxTHIJyQjialQZfMpAyij7DFavn4kZ8zx?=
 =?us-ascii?Q?/aGC1hqpuBcD9TPe4mbK/GgkmVGsyJTnVZWHKqC55tHDfQD94jBF2A+aSfm0?=
 =?us-ascii?Q?1A0OmB3uzfMBFU9Meu91zXCZ9gJmmApq3+QKI/CEIYJzq86KnWCI1A4KW53O?=
 =?us-ascii?Q?ns8TiKQ0tFYQeZenlMLwwED1kRMHeN9ReCDv2huCdLH4cUgU4eacVP1fB9xU?=
 =?us-ascii?Q?GbPQ+cvR8i/4sVSUxlhV1PAtA9RfqcR2fpo3O1/KmCDZsnTPCpKqys+K2FhY?=
 =?us-ascii?Q?gc29FikBCSUXTH3/z2tGtVBqB+WqBjVZhrxTGv9tLWdLx+tEkEdOqzdLY9Sj?=
 =?us-ascii?Q?xHArQuNIDNoj2A/vfZIhQx+HwQIUH10OdD8udAdjDf5m2AIyZGqsUS+6mZgC?=
 =?us-ascii?Q?QnJ6s2Kjj9eaxJxpd+cI8mPxoW+6chIT/9sJC+VdWsSpPsN7y9yqUaF7Xktv?=
 =?us-ascii?Q?+TH8cNFI8EIRfIEvAXdzszMLYrx+FldtNyj0tsFg6x1eYLjU43m+ho/kTGRX?=
 =?us-ascii?Q?xjOmGyIKGAU3K/gcbR9pQi0y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c189ffda-74c2-4a89-26ae-08d8ffad240a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:23:57.3359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qFjA5XQOKDc6HZefPPNo1/o+BMHRZTN35gjE3ofvYRsLjVVq9LF7slzlp7y6aj3N/HDBm5F8MKIrceYslcnIXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3839
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
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
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
index 936b3cfdde55..a66a51301643 100644
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
