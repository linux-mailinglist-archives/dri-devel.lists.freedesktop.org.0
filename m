Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1952F343F27
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85666E40F;
	Mon, 22 Mar 2021 11:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B3A89C52;
 Mon, 22 Mar 2021 11:07:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9kd4JdA81Z0/etsNrJI35WIvCI4wfe/7t4apbSn3hCtvG97XPf8jyD7CzWkR769ku5/boEn84qhUY/I0lUL9ttdzRhpSsG2WDesg9ZXLoBV/1btpVRszyYjB7GlLICaghnir537xZSIC6Ofk7sOl0aVerw5Ow6yqYDbqx1XfL8FCjrehjYgIcajKdJ6mQ+/M6Xc3QTlvPWG+PJrDM5PX0oSrH+Xk5zHqyspvTKQFavgeIiRWCzge8PPW41usybVvpwnzJo+G+rNsquIQtC6vJHzuGpo2IAsraKLEiN4IFuVi+2w2eIJLE3SqSLoNFVmMZz+Q2J1hyQqWTD6P0H52w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzrRUwlZRwRXoYlwkSZ919/grqACVrnSHCZhFyCSFRU=;
 b=mCMX1TcP9N+fJx8hwqiJa5QrZGvcA8TrVjRf7bAYCd44d+PhtVSgG5KtKmxJ/zRnSzP1GOvPTe6vQkHZvUtUuYJxUrbL/EeKS13m84j/QUseFSNAf664IM15FTs02PGT8qXImQ0rfLyoPvKssTotmjnHLML7G3xkKdMUN3h1mPqZd1mLF5bPMU4AFBuPnacIChQH/w22L0sUZqt9zYxJkRcCLRFSws2zvGb1gjQAiFSKtLuhulECpNzXso1/59p6YMEO90xocBEojeERMV06cVlegbmzUmxSlRzRIUDZfZbe4IYlBRFjuTi0ko9kI4R3b17hMQ1gzgy3rZfiNqPyYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzrRUwlZRwRXoYlwkSZ919/grqACVrnSHCZhFyCSFRU=;
 b=ptxwkF97ayFhvs3kAWmUM5Uz2iU4PE4liZwR+fd2AnIEqNN+Qr8ujq7yzSVhobIo4OahVjWzgHyoLsK0Sagv3ogmiHGrOnrxYh9cdwPK61/oVuSyegPALlF+WFdcy6j+efT/c5LAWbCr9a/ksGLiQoGXh/ls8Ik4mJ/7sZo8xjs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3678.namprd12.prod.outlook.com (2603:10b6:208:158::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:35 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:35 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 11/44] drm/amdkfd: svm range eviction and restore
Date: Mon, 22 Mar 2021 06:58:27 -0400
Message-Id: <20210322105900.14068-12-Felix.Kuehling@amd.com>
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
 Transport; Mon, 22 Mar 2021 11:07:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 91164246-2608-4576-64a2-08d8ed22b2a5
X-MS-TrafficTypeDiagnostic: MN2PR12MB3678:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB36784A34B46822563DE8F94892659@MN2PR12MB3678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OoEdR5jnHdXNEdyX2QJeBW5nNVHehFq4+CAKU9Ut2tSs/jtQ6IA+4MexYkHSwX1ga8CeA38EVHuI3OJSlQBYtQEKRnc80XTvfB3s/9Rr1hixFASVX48KKR4FKixx65dWjpBeBy37T5V0N95S+fALiipcUFeGG3+U5lHc399uC0LSvhMdArdaUMStqsn52lX7StlS8j7psVlEDGFvoCAFyD43SOMxt+/FmLAz4iYHgP2rQGKRfCfonqxqDQ/8q2qNgaDojaw1dIBiLQd37dPleEk1Hx/u9+CrVeijIXzbPihsvK9Op1mbhQ5YWh5Zn333cc4ydAZdmOZu0+POlbKehgo7a9XflBU8Kj8vZ6HgCA1UvESFe/GBNHOeF9BCtLBuQU48jYf4UH8GNfwv7RtsxEOZlkhC/rreukbCJBiaSuFb1xjScaLXgNT1alDlFLTrVvtreo4zDTwELAbF3kDuXnGSfQidkwO+5IIZfSNr/ci+oAzWgnbDl9032uYipIziH53kea9aQsxRNpX/lV0p9sAV8E8arS3QpLTCwnSknTxGyD7BzXZxZVJivuZyTHolrJ0sLvsU+cQIAJTKxXXpI3GdyQW91iCbB6dk41kWesxj14hSx69zJAQsmKlchGlbxKi7uoSi1U+CrhPRZAVVWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(52116002)(7696005)(6486002)(1076003)(36756003)(38100700001)(6666004)(83380400001)(478600001)(2616005)(956004)(4326008)(450100002)(16526019)(2906002)(186003)(26005)(5660300002)(66556008)(66476007)(8936002)(66946007)(316002)(86362001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?VBDCokWRhdc9PoNx0of/u3ncP4+yP+liSrYtQWny+BLuz9IKaHdGKB4XvFwS?=
 =?us-ascii?Q?jyl4MfHJLaT2/ir4olqO/63R8RRutNBgXDZO3e/18FuLLydJm5JyV9iq481k?=
 =?us-ascii?Q?ghiaiYMDRSRzRSMiIKtiQBsLKlRu8KfbDoO8m8PZUDtgEc5UekhWhxCnAChq?=
 =?us-ascii?Q?aa1+Hqb5edJO9akR6XC6BWnFhIrujqUo38tlBkzB1/4yn7EugCmhz+kYuMSI?=
 =?us-ascii?Q?s5l7Xla6cy5lcmO28MlYY9wlNZ7xD6O10cRhZH7lTj9z6Oj6dsE/WFdieikm?=
 =?us-ascii?Q?Tg2fPRIaWt236vICnicY0xBgZSURhWWLAgeg2Kwiz6+kvHlpm5KuIei/1DLD?=
 =?us-ascii?Q?2/sB7rsWC8fqifCkfw/j+zbPHnzbsJmNEUaq4N13z5GXIaKoTqvHLuFTP0vV?=
 =?us-ascii?Q?gmJpwHqKeSx+9oXHJomoEmctkgFN9K0ZwG3iL3/3y7zL1lYcb/URiqzD7jqc?=
 =?us-ascii?Q?CuIuAARTem0udtX48yTkbLNCE/mEIZgREL1H/SuIcGLY9sHUUvgf6SRp9mBc?=
 =?us-ascii?Q?YZIRwC6E6A/Ci+HPs1P/VFzw4BKA0BcgWxyVvGnNzGZQhqT2boJbiHFbEtI3?=
 =?us-ascii?Q?Z3DhDL8RkcDIpidnjG6ZOI6VhoxzUyz7Kkd+y+Nu0+ODueIvnW+55uA33Ocw?=
 =?us-ascii?Q?K8yT4GJZnKtDT2xwUAQMsNG0yI0La41ljC8mFO8mJXlI8FeHsvVt43fshVdd?=
 =?us-ascii?Q?QbaaP+Bf1vpaghUbVrMxheTO+MKzdXcnukSdl9RdHlAj623HzZocWJ5zimzA?=
 =?us-ascii?Q?MM5nNPOlLuDJgt50E7EXaNVkbeQOaF7Az6717obG/zyqYulXuyIggbvrrkTr?=
 =?us-ascii?Q?eYDQ8eByxAVKJSPFzJg5NXqt2YxrwpWp+vhqin9/BM0YJNck0xDnRnyQ6FA4?=
 =?us-ascii?Q?xhSxc8yLj53TMjdUDq6ubG9o9LGsMFdEIGevsVq2Ua3yFDVTyWVVD6rVgZ/u?=
 =?us-ascii?Q?5SQf8A4ZoyGmzfXfvHGMzoEey2ziFwhQhrHZ3HtyAWsA/GG50b5PlltME6G5?=
 =?us-ascii?Q?u7bHJQNA/rYh88XiSn6F+NpI8OwcbTNv6QqRw0QCrI/2NC8mVLni5B/G/5Ad?=
 =?us-ascii?Q?q0/XZgERye/9woVfIbykkXOPHRlUxZQkJBVQnA5tLAT/RnmjzA0QWMXOO53S?=
 =?us-ascii?Q?u37mAlGtlynG1q6Jg/zuCH+xjDDEK0dsALEWJ3T2/1D3eF7B1G3xsagaTCQG?=
 =?us-ascii?Q?NyUuyQr6fjcas/epvkA6273aZ/puRgjdFDxjN4vib3ME92ARSnbXPWpHtWOD?=
 =?us-ascii?Q?ohyCITsxMoodMmXhI/Rkk1rHrtBj6CFDhX0MSQ7H3I1TSO4YI67frla0Idsh?=
 =?us-ascii?Q?ejQ2xuYB+F57qA8QYCjjCtEW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91164246-2608-4576-64a2-08d8ed22b2a5
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:35.7010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rN7HGT/wst0qv2jkOiiO0RRP3YG2yp36jWkb1JiooFkwdz/jQ2tWm5us09g06TJy+BVXsO7DNlImD83cB8+mPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3678
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

HMM interval notifier callback notify CPU page table will be updated,
stop process queues if the updated address belongs to svm range
registered in process svms objects tree. Scheduled restore work to
update GPU page table using new pages address in the updated svm range.

The restore worker flushes any deferred work to make sure it restores
an up-to-date svm_range_list.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 145 ++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |   2 +
 4 files changed, 149 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 4101f5341ec9..7d70af26b5c7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -738,6 +738,8 @@ struct svm_range_list {
 	struct work_struct		deferred_list_work;
 	struct list_head		deferred_range_list;
 	spinlock_t			deferred_list_lock;
+	atomic_t			evicted_ranges;
+	struct delayed_work		restore_work;
 };
 
 /* Process data */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 4d7a67141190..321895d7555a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1064,6 +1064,7 @@ static void kfd_process_notifier_release(struct mmu_notifier *mn,
 
 	cancel_delayed_work_sync(&p->eviction_work);
 	cancel_delayed_work_sync(&p->restore_work);
+	cancel_delayed_work_sync(&p->svms.restore_work);
 
 	mutex_lock(&p->mutex);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 1244ba380292..55828d6fbea9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -21,6 +21,7 @@
  */
 
 #include <linux/types.h>
+#include <linux/sched/task.h>
 #include "amdgpu_sync.h"
 #include "amdgpu_object.h"
 #include "amdgpu_vm.h"
@@ -28,6 +29,8 @@
 #include "kfd_priv.h"
 #include "kfd_svm.h"
 
+#define AMDGPU_SVM_RANGE_RESTORE_DELAY_MS 1
+
 static bool
 svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
 				    const struct mmu_notifier_range *range,
@@ -226,6 +229,7 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
 	INIT_LIST_HEAD(&prange->insert_list);
 	INIT_LIST_HEAD(&prange->deferred_list);
 	INIT_LIST_HEAD(&prange->child_list);
+	atomic_set(&prange->invalid, 0);
 	svm_range_set_default_attributes(&prange->preferred_loc,
 					 &prange->prefetch_loc,
 					 &prange->granularity, &prange->flags);
@@ -282,6 +286,9 @@ svm_range_validate(struct mm_struct *mm, struct svm_range *prange)
 
 	r = svm_range_validate_ram(mm, prange);
 
+	pr_debug("svms 0x%p [0x%lx 0x%lx] ret %d invalid %d\n", prange->svms,
+		 prange->start, prange->last, r, atomic_read(&prange->invalid));
+
 	return r;
 }
 
@@ -886,6 +893,134 @@ svm_range_list_lock_and_flush_work(struct svm_range_list *svms,
 	goto retry_flush_work;
 }
 
+static void svm_range_restore_work(struct work_struct *work)
+{
+	struct delayed_work *dwork = to_delayed_work(work);
+	struct amdkfd_process_info *process_info;
+	struct svm_range_list *svms;
+	struct svm_range *prange;
+	struct kfd_process *p;
+	struct mm_struct *mm;
+	int evicted_ranges;
+	int invalid;
+	int r;
+
+	svms = container_of(dwork, struct svm_range_list, restore_work);
+	evicted_ranges = atomic_read(&svms->evicted_ranges);
+	if (!evicted_ranges)
+		return;
+
+	pr_debug("restore svm ranges\n");
+
+	/* kfd_process_notifier_release destroys this worker thread. So during
+	 * the lifetime of this thread, kfd_process and mm will be valid.
+	 */
+	p = container_of(svms, struct kfd_process, svms);
+	process_info = p->kgd_process_info;
+	mm = p->mm;
+	if (!mm)
+		return;
+
+	mutex_lock(&process_info->lock);
+	svm_range_list_lock_and_flush_work(svms, mm);
+	mutex_lock(&svms->lock);
+
+	list_for_each_entry(prange, &svms->list, list) {
+		invalid = atomic_read(&prange->invalid);
+		if (!invalid)
+			continue;
+
+		pr_debug("restoring svms 0x%p prange 0x%p [0x%lx %lx] inv %d\n",
+			 prange->svms, prange, prange->start, prange->last,
+			 invalid);
+
+		r = svm_range_validate(mm, prange);
+		if (r) {
+			pr_debug("failed %d to validate [0x%lx 0x%lx]\n", r,
+				 prange->start, prange->last);
+
+			goto unlock_out;
+		}
+
+		r = svm_range_map_to_gpus(prange, true);
+		if (r) {
+			pr_debug("failed %d to map 0x%lx to gpu\n", r,
+				 prange->start);
+			goto unlock_out;
+		}
+
+		if (atomic_cmpxchg(&prange->invalid, invalid, 0) != invalid)
+			goto unlock_out;
+	}
+
+	if (atomic_cmpxchg(&svms->evicted_ranges, evicted_ranges, 0) !=
+	    evicted_ranges)
+		goto unlock_out;
+
+	evicted_ranges = 0;
+
+	r = kgd2kfd_resume_mm(mm);
+	if (r) {
+		/* No recovery from this failure. Probably the CP is
+		 * hanging. No point trying again.
+		 */
+		pr_debug("failed %d to resume KFD\n", r);
+	}
+
+	pr_debug("restore svm ranges successfully\n");
+
+unlock_out:
+	mutex_unlock(&svms->lock);
+	mmap_write_unlock(mm);
+	mutex_unlock(&process_info->lock);
+
+	/* If validation failed, reschedule another attempt */
+	if (evicted_ranges) {
+		pr_debug("reschedule to restore svm range\n");
+		schedule_delayed_work(&svms->restore_work,
+			msecs_to_jiffies(AMDGPU_SVM_RANGE_RESTORE_DELAY_MS));
+	}
+}
+
+/**
+ * svm_range_evict - evict svm range
+ *
+ * Stop all queues of the process to ensure GPU doesn't access the memory, then
+ * return to let CPU evict the buffer and proceed CPU pagetable update.
+ *
+ * Don't need use lock to sync cpu pagetable invalidation with GPU execution.
+ * If invalidation happens while restore work is running, restore work will
+ * restart to ensure to get the latest CPU pages mapping to GPU, then start
+ * the queues.
+ */
+static int
+svm_range_evict(struct svm_range *prange, struct mm_struct *mm,
+		unsigned long start, unsigned long last)
+{
+	struct svm_range_list *svms = prange->svms;
+	int invalid, evicted_ranges;
+	int r = 0;
+
+	invalid = atomic_inc_return(&prange->invalid);
+	evicted_ranges = atomic_inc_return(&svms->evicted_ranges);
+	if (evicted_ranges != 1)
+		return r;
+
+	pr_debug("evicting svms 0x%p range [0x%lx 0x%lx]\n",
+		 prange->svms, prange->start, prange->last);
+
+	/* First eviction, stop the queues */
+	r = kgd2kfd_quiesce_mm(mm);
+	if (r)
+		pr_debug("failed to quiesce KFD\n");
+
+	pr_debug("schedule to restore svm %p ranges\n", svms);
+	schedule_delayed_work(&svms->restore_work,
+		msecs_to_jiffies(AMDGPU_SVM_RANGE_RESTORE_DELAY_MS));
+
+	return r;
+}
+
 struct svm_range *svm_range_clone(struct svm_range *old)
 {
 	struct svm_range *new;
@@ -1256,6 +1391,11 @@ svm_range_unmap_from_cpu(struct mm_struct *mm, struct svm_range *prange,
  * svm_range_cpu_invalidate_pagetables - interval notifier callback
  *
  * MMU range unmap notifier to remove svm ranges
+ *
+ * If GPU vm fault retry is not enabled, evict the svm range, then restore
+ * work will update GPU mapping.
+ * If GPU vm fault retry is enabled, unmap the svm range from GPU, vm fault
+ * will update GPU mapping.
  */
 static bool
 svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
@@ -1286,9 +1426,10 @@ svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
 		svm_range_unmap_from_cpu(mni->mm, prange, start, last);
 		break;
 	default:
+		mmu_interval_set_seq(mni, cur_seq);
+		svm_range_evict(prange, mni->mm, start, last);
 		break;
 	}
-
 	return true;
 }
 
@@ -1307,6 +1448,8 @@ int svm_range_list_init(struct kfd_process *p)
 	svms->objects = RB_ROOT_CACHED;
 	mutex_init(&svms->lock);
 	INIT_LIST_HEAD(&svms->list);
+	atomic_set(&svms->evicted_ranges, 0);
+	INIT_DELAYED_WORK(&svms->restore_work, svm_range_restore_work);
 	INIT_WORK(&svms->deferred_list_work, svm_range_deferred_list_work);
 	INIT_LIST_HEAD(&svms->deferred_range_list);
 	spin_lock_init(&svms->deferred_list_lock);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 596c881f7674..2a76e89dec04 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -66,6 +66,7 @@ struct svm_work_list_item {
  * @perfetch_loc: last prefetch location, 0 for CPU, or GPU id
  * @actual_loc: the actual location, 0 for CPU, or GPU id
  * @granularity:migration granularity, log2 num pages
+ * @invalid:    not 0 means cpu page table is invalidated
  * @notifier:   register mmu interval notifier
  * @work_item:  deferred work item information
  * @deferred_list: list header used to add range to deferred list
@@ -96,6 +97,7 @@ struct svm_range {
 	uint32_t			prefetch_loc;
 	uint32_t			actual_loc;
 	uint8_t				granularity;
+	atomic_t			invalid;
 	struct mmu_interval_notifier	notifier;
 	struct svm_work_list_item	work_item;
 	struct list_head		deferred_list;
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
