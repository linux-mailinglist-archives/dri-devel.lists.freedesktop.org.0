Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DC02EC88C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:03:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E326E405;
	Thu,  7 Jan 2021 03:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F966E3F2;
 Thu,  7 Jan 2021 03:02:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTcZ5RjSn+HFwgJNdBJyazIyfEY3oCi+9VEvIyaMkBgs6HoPEKLW3yc5BAwoAK7/lm0Qi6gPfpiP5uyWjYbrespE4LKrRIdXw6tzmcsI5asrw1mlky8E8GY0fCd1MbpAEHNiDdX01HvtG9RoVI+KEkIMzyD7zmOSp1Gb3nc94RK6657sM05FOx7ZAwg8CnqGHY5IuDSHJQcaSIoVjlzfcClCyN2yUY0jvvAhcNCtU4XpxGvXihGooh1M1x1YQIAFiMcfwG3cpCVF8MmAWwuNsS9TUefNA4PfcFqMHMPVzEDfRP6o/JcTdiP7mezgkWrcNLTSEB4OTQ+SiAKrPubV4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4sdjXOtfMLISU98hGqZldEFh1KWH7nRtgbJPJ13W3w=;
 b=cOkz/UU3RYB482Jw/9KQYrKCCFGYZStwnv9GzZGJjyN2s8XX4FofkX19UzbWWUoP+hJ4HhOKI/H6ytXIFxWImvys4f/D1qBMVjboH7aIVBl2sTF6FPc4OlIAKF2cVUNDN8uHhcSbl4Vqi0NKzlal5VfgvPzNWgEX9D038Q7Dj7fHO49YgiNepSzAgS/c1N0fW6+or4MbiVU5zV4cMydbCPrZN+8qPhoGfS1YAIExY8wkC4LsltEGsbc2YIbw2dL80hSPsc6F47gOMj/96VZvD0AMW/cNYgmFg2V1Hk9/tG5xLkG/qeEqDn3Bdmlv8zWo2kZGCdozn5vq4Id7uxttLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4sdjXOtfMLISU98hGqZldEFh1KWH7nRtgbJPJ13W3w=;
 b=XWRGTfkpL5gCB6xVCTMsFY+GCdYVcVmEC1ZfI7/9LMLnsk2JPS1HaUt8yh359DLNECPPbM/t0onTI8xpdA8G/Bz+eFNSOr+wbOp/hkBBq0sJ/QCwHotEMJdIrthJ2LlQG9Yc/WGjhYYde9t+TX7B2JsmEgjio1ldf3AW23oqF8U=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3999.namprd12.prod.outlook.com (2603:10b6:208:158::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Thu, 7 Jan
 2021 03:02:51 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:02:51 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 08/35] drm/amdgpu: add common HMM get pages function
Date: Wed,  6 Jan 2021 22:01:00 -0500
Message-Id: <20210107030127.20393-9-Felix.Kuehling@amd.com>
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
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:02:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7e98beef-fde1-449f-3349-08d8b2b8b899
X-MS-TrafficTypeDiagnostic: MN2PR12MB3999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3999DD299EEE4CBA2D8F8F2492AF0@MN2PR12MB3999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BGSZCmKk42SdoTqolBpxLDsWBeK5eaEn61skys7a5X8c6OdxuDpeBAyvhNHzyWEYfnWmFvdyDWwwu5wIKmrFcoYrzRoEsN8ICKD5vDr0xC2Jso4hghy5mr5hEB5KEy61QX6JvHepyHdUuW+KJS8SHapoSc9zCddTmYCey1JQkLZqn7Z9d+G7zvuLME5qfgz+JCOSngUKPLN++O4x/Lh/WmupE4ZoIXjNjscIEnh6Fi9C1xq5jHBY/xK+uDzNjN8/S4DtZgLNLvUeenpFHKZ3qqjRoYt4E413tLM2rf5TmEzH3DBUZc5CP4PB7bOMsOVCQcflaUkJGerx4q4cJC3zNyhh/eapg9wLDdbmQMHhIzW5Q9HqdY+sm0IVs18lYoeMqRZuhGDkOjDjii2v7m1AVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(316002)(6666004)(7696005)(2616005)(956004)(8936002)(4326008)(66476007)(8676002)(478600001)(5660300002)(26005)(52116002)(1076003)(86362001)(16526019)(66946007)(450100002)(186003)(6486002)(36756003)(83380400001)(2906002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?n8ONwHL/qzs96q3QZkYTwRQXFV/bfpY1RCFLQQ3ITL+sKQVUBxsLFbGs/iwq?=
 =?us-ascii?Q?+lNIJ8qd/+oOcGPNlnXxeQSgvtuxY4jXUYNmXlxIIdLmJwrvQ/5Mp2Tz8BuX?=
 =?us-ascii?Q?qGoEnfN1cTiNdCmlMrHx01qH8/i/zlma/jwFkAgqrTYc1RnJ2Sz8sRc8CR0R?=
 =?us-ascii?Q?gXTBqNZzQrkdVNPGGZCLeURdlguZWvmSHe6JgkGy3lBDIxVd1sr4Y9OYJbUy?=
 =?us-ascii?Q?7W0nA2vLgypBRUrBVm5lxvY4i5z6htl3Wr95xz3VkO5/f1fxZ1Wtdyh6rg9h?=
 =?us-ascii?Q?9cayolf74eOZn9WhRhoY5gRKJ5wdm6G/Ljm0eznPVX2i80mGWMlkOyIczV/L?=
 =?us-ascii?Q?gVJXkxZDMl5GiL+T6JhNlMTJ9XzaX3K0pCLea27rpRsIq1mydwS5y42WgtEm?=
 =?us-ascii?Q?FE/gH4AQ3Ut6tMyOFW5UgWbJ2wHyC2dSw/jZlGbpd/Xp30l7alIvx+nirydy?=
 =?us-ascii?Q?wV4ncUp1ZrNRaqxDzvg+eXBUpjDYFUitkoYMmdItON9Sk+7jFA7eG/ZJPD9w?=
 =?us-ascii?Q?bsLZb83uONxGdRCuuuXwlKwkde25RZ7eMo3x3woKWXC6TKABKiYf5C00ZMTT?=
 =?us-ascii?Q?dYJRnLBQtUndnMzJYFMOdkBzDEbbgK7w0BvybI4y58cQg4ASI8mteSN8ezrr?=
 =?us-ascii?Q?0yBixNglrp4dkYPnfQq/9ggXH+UCvY5E7Ti69Qn0GvpkGkgVWKYRAv5pDJZ4?=
 =?us-ascii?Q?0R+U2RO49AWc513asALyF6R6GqMFKhu/iDeZdQCYMOeIF1WoKgaghADRZakz?=
 =?us-ascii?Q?ITz1dTQNyYxxIy2kT+6fKe1eTGCYx9CA5+4Ioq/NrLQtXjGstWmxa1iCcuwp?=
 =?us-ascii?Q?4RSN8q2fJfQzliPOlFofDJ5bz8BDOZUWQgFv1e1VrrC0KCG3yyANWj7FVnkx?=
 =?us-ascii?Q?FBu8lgr/SbNM7p4eRVQfUoJXrzpms75vB6Ad2k26YpADu48l24wrGBn/AGDA?=
 =?us-ascii?Q?ad96uB4egrc7QzLerFsdDYrAjwTwZCARMmJjbD4uzUQ2I6+FoE8jGx7wQT8+?=
 =?us-ascii?Q?AwkO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:02:51.2674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e98beef-fde1-449f-3349-08d8b2b8b899
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wh/kqDPL4o2EnAcVJvkiQH97FyiYxzpUjZhx/4aLQWSHQReV5TMEpi5YKMiujj/RsR8oqcrM7QebxL9e8K7Xiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3999
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
index aaad9e304ad9..f423f42cb9b5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -32,7 +32,6 @@
 
 #include <linux/dma-mapping.h>
 #include <linux/iommu.h>
-#include <linux/hmm.h>
 #include <linux/pagemap.h>
 #include <linux/sched/task.h>
 #include <linux/sched/mm.h>
@@ -843,10 +842,8 @@ int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **pages)
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
@@ -862,76 +859,26 @@ int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **pages)
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
+		goto out_putmm;
 	}
-	mmap_read_unlock(mm);
-	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
-
-retry:
-	range->notifier_seq = mmu_interval_read_begin(&bo->notifier);
 
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
-	}
-
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
 
@@ -960,10 +907,7 @@ bool amdgpu_ttm_tt_get_user_pages_done(struct ttm_tt *ttm)
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
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
