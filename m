Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2F3354A61
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7DF96E23D;
	Tue,  6 Apr 2021 01:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF5D6E201;
 Tue,  6 Apr 2021 01:47:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K96g0kKb0JXw94VOLNANg5or0h/r18p5mvb+FX80TIyTwRf28rhoi8U0Th2k8dylAEx/mq+j9xve5/PEUkUb7TxQ7x2XJzxHYMCzk6OA6hcxkuSd35BZ6X+ObuXuAe5buJATIcavkZa2i8ZjAEgX8r2BupjSgwMuFLk3ueXXFz18ut7gB5iUn1jq7kA+UYhwBgXKTNVUQbYbuqs0cmGyHrWWc9bqZBomYRzIB55h++r6+WZeaAOTOA3R5L6NGBpZ+hAlUGPnuhF3b2IKGq3LpQ+ujvto+6VfIAZpvKshxy7hb1gllrbt/OKM/m9k0YezwSgM6FMKA2oA9vVInmO0+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQC3WTU//Ot+qtuivzMoH4dcPh9Fxe8aiJM+mtqfXXA=;
 b=KpJF7/LhkPi7SgCoTPlBe9vxtD5chSMYMABJsADf8Vd7Qll6hjvib7N84u9gOkBaZ+CA/bzEkQvddnXQ/R6ykA4rqC+4b7dQrIQhmb4P/n+lyRslutsqPVSvEz7j1/PltpxdqUYgbWIPPmiqKpVrQahXzIz46l/0McAtKVUbcoxG/0ttz6YOnSKsojAXS9IGmEwYboCzMZ6GIqzFd77mteV/8ePprEF34TCfFQGcGk/AIzVYtEe/LOhnu7NPa67dWxaks4YrXloUUhoGAlJSSQR79c5UlNnNmmn8Cq20+b6CUs4rEIFSy3J0owVxHRj/Vy71JoJEb1SjogPmz2krdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQC3WTU//Ot+qtuivzMoH4dcPh9Fxe8aiJM+mtqfXXA=;
 b=B/WVK/t+v/wBjqWiDS+pkZIJYa21+0fMBbtrwf0qBDv2m0u8ERPniOTTC+D4JzxDYQJFVRblRhw0DrvJ0Ly+nJR5zcZ0XQLtit/XLak2tXwnFd4A0JLAE4ZXJ29REYkL2Y1aji0c8IOW2k1RiZ24o1Oi4QqgHGjDufZtloEa2w4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3773.namprd12.prod.outlook.com (2603:10b6:208:164::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 01:46:59 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:46:59 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 11/34] drm/amdkfd: svm range eviction and restore
Date: Mon,  5 Apr 2021 21:46:06 -0400
Message-Id: <20210406014629.25141-12-Felix.Kuehling@amd.com>
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
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:46:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e51399a8-97d8-4cd6-02f9-08d8f89dddf2
X-MS-TrafficTypeDiagnostic: MN2PR12MB3773:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB377342ACE54A24D90111741292769@MN2PR12MB3773.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P5sukFpCpudVmFMQiI0PFopcNtcHOxvBMdPfWDa3XNAFnP9mVexMIRfgy/z6fqL6YOGwQvZfLEjqC5VA8T7h4ynEKGaqlBbOEtAfTSS63KCvNEtfeCRfZicpTbQpoBTb3X4hyg12bA3jKTEAdBSRVAzCvKaihlG2KZjpBEzDhxuQHngdRp3FFqoVCzizoRZQ+aFQGCLG6RYf6i7mfTuX9gGzODt2gJUj8JIxvCrCL1kLZYDlQ8yYkT+aByzYGKE+ph5NbnjdnueJJnYnYgMKFbGHAu3+jyQHrWd8m0iJA7WcxJv/dQyXOU5dF3+tzS27vLxA2EKnuxUdaha1Lb2y16YTE4vhQ8z9aE1d5FYXZ8VK3D47O3UN8fbcYshV9NjVBZ+AWtzn2j/tlQJ4dPif4C0T84CBhb+jVrW/NhPP4r06k9bizWS1GDKe8SGCTlRbt8fq9VriLJ56JXP0uE7tANpzKLo7PMLmFfcrd0WLFWX7VaX/RjpQLZ8Q7XaqDyJ+R2ZTR0uHqVK9W0d3rApsxy7lLvnpZqWtNoxPDc0XmiW6n+J7F973iN9yVFOQWfmbpdhcSMr8gbSPR1pVRvRHFvk1raaYSKWzrHYBNQkUNSZ3uiIpeECmn9jw/wGuCYjoCwPt+K9/DcRMHsh5Meosoq9w/p7UhFnq+OfqOtM3FhjGyrix671iIfTT6KiAtkVq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(478600001)(5660300002)(6486002)(316002)(52116002)(66946007)(1076003)(36756003)(2906002)(16526019)(186003)(26005)(450100002)(8676002)(8936002)(86362001)(66556008)(66476007)(4326008)(956004)(2616005)(38100700001)(83380400001)(6666004)(7696005)(38350700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?PbSBd74iNHIy69MioS1VnruMkb95LMtdQsTwx6o9ByOy5RFc+O+UucE2IkqA?=
 =?us-ascii?Q?kjWXj+WQgdPULLHIvXCMJnciCkW+l1YNkZmX7WKq79lLE8Khj2/Ibp+YWJUw?=
 =?us-ascii?Q?AMczp+7H1BACZUdmQnarMoGun2w7cvJrg1nY2pgud+B0UxfDgD9b0hU4ctUl?=
 =?us-ascii?Q?iCQvAeBOLRgZTE3PGOuHGn9IjTFMhEuAM6euzNfZ7FRX4HQeXK6uZKV7eog/?=
 =?us-ascii?Q?uxH89MaYv6O3ItC2uH+5Xy3NFMTjPsHP35/6ojvkI8w3c0TAdlC25AuiEoop?=
 =?us-ascii?Q?GR8HcBem2bGOiv8dnjLo482uzNI3GmlhdW/ZpMstbAEpjSZ98HSVaV6eY6y1?=
 =?us-ascii?Q?fpj/iyEe3Se4GxKsOcMKo3HBvT9imY1H+GJHdor9j4neiFUvgmD311yEP5SP?=
 =?us-ascii?Q?VwaDEEXLCW8FdpU5+egwvMwDLzTXoisfzCjT/W4Rfq9DLltKiVUAcdp8mZWK?=
 =?us-ascii?Q?oPqLwFT4IwYjurxZsgyp0zq0mWD6ga/eT0JviiIJk0iXA0aRlPiQuEXJVpkD?=
 =?us-ascii?Q?jWL3vPQYGxxymKc7VkET2eSkmrInvgVZcfxCHsD1PyViCzVaBVTqWn6RT8tr?=
 =?us-ascii?Q?Ga8mn4MQXUicq1F5ZvSfRQA7PvCs4W2KF0I8sccJx7v1woaYSkY91ez00RIp?=
 =?us-ascii?Q?S8rofuINdwYeWw7zKorZ1Jfhb0rrsNyrZ94Li55mopGpnaBQnwETm/De32/o?=
 =?us-ascii?Q?e/KLA1k/EVtbK3IHL4ABcmlzuKrUjnxcLIi48WKo7D/N4YMEuVmn/jpW75zt?=
 =?us-ascii?Q?G8oV4u+WXdYSj6ElPawY1+3jaVqT0kktsNUDKkzdRH4uCEcPN6PAinIbV58d?=
 =?us-ascii?Q?oRYAq8MxAe6MEAuBltKDWNDg0Gplh8ikAWVIbiy7uXRLkZELBcQM+cQBIDb9?=
 =?us-ascii?Q?/TE2OUDJ3j8PDKn72Z1yLBYbU7PTPhjqJobYSNkTQdS4HCJeiYsJ1V/zCRTK?=
 =?us-ascii?Q?UKhLvdDx5PFzYx9IrXZUIgAWCQKYc3ACRH8rZbT4Yy7GOxYOl9x4bIyCC10q?=
 =?us-ascii?Q?aCNTZjwut+5GMG0/R3gUCjz45zqT7bD+dc71h5f0/Yc4RwcY0H5kEPe9lSW+?=
 =?us-ascii?Q?Nc6CeDu8IzYJZVijkzPDsRXwzWsz0tBfYcYdNTekDTo1/HenNMG1jQB7FrFG?=
 =?us-ascii?Q?LtjrJPdrWTkkw1ZyYR1Mty58HFRtGuUdYOj5jF3gaICpTyG8PZi2hN8+Rypn?=
 =?us-ascii?Q?qp9aIZyWZW7lY8+9A1gty1YrT+v3CQ9vGZasOrm90k5CcceTKSp7I1PMJ4aY?=
 =?us-ascii?Q?KEy3PVSxty8dC25efZP3BnC7BrG3NIMyGQQqPkUovwzEMm8AW5p+EGsPluc1?=
 =?us-ascii?Q?4Z0L3qWIf26amb6DC5EoiyOm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e51399a8-97d8-4cd6-02f9-08d8f89dddf2
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:46:59.1587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zw+w540YTtMRWYTdLLz4RvhKxSEfgXKRFNNqZu/ehCTnuMXDsBgtPx6I7Zi+0Jc6rUdc4GtQsfIBy0mMWZsrNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3773
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
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 135 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |   2 +
 4 files changed, 140 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 0d19a13fc227..1b829eef9e50 100644
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
index 1f3d4f5c64a8..3bcde43ccd70 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1064,6 +1064,7 @@ static void kfd_process_notifier_release(struct mmu_notifier *mn,
 
 	cancel_delayed_work_sync(&p->eviction_work);
 	cancel_delayed_work_sync(&p->restore_work);
+	cancel_delayed_work_sync(&p->svms.restore_work);
 
 	mutex_lock(&p->mutex);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index d951af42feed..30718cad6896 100644
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
@@ -250,6 +253,7 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
 	INIT_LIST_HEAD(&prange->insert_list);
 	INIT_LIST_HEAD(&prange->deferred_list);
 	INIT_LIST_HEAD(&prange->child_list);
+	atomic_set(&prange->invalid, 0);
 	mutex_init(&prange->lock);
 	svm_range_set_default_attributes(&prange->preferred_loc,
 					 &prange->prefetch_loc,
@@ -964,6 +968,129 @@ svm_range_list_lock_and_flush_work(struct svm_range_list *svms,
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
+	evicted_ranges = atomic_read(&svms->evicted_ranges);
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
+		r = svm_range_validate_and_map(mm, prange, MAX_GPU_INSTANCE,
+					       false, true);
+		if (r) {
+			pr_debug("failed %d to map 0x%lx to gpus\n", r,
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
+	int evicted_ranges;
+	int r = 0;
+
+	atomic_inc(&prange->invalid);
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
 static struct svm_range *svm_range_clone(struct svm_range *old)
 {
 	struct svm_range *new;
@@ -1332,6 +1459,11 @@ svm_range_unmap_from_cpu(struct mm_struct *mm, struct svm_range *prange,
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
@@ -1365,6 +1497,7 @@ svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
 		svm_range_unmap_from_cpu(mni->mm, prange, start, last);
 		break;
 	default:
+		svm_range_evict(prange, mni->mm, start, last);
 		break;
 	}
 
@@ -1390,6 +1523,8 @@ int svm_range_list_init(struct kfd_process *p)
 	svms->objects = RB_ROOT_CACHED;
 	mutex_init(&svms->lock);
 	INIT_LIST_HEAD(&svms->list);
+	atomic_set(&svms->evicted_ranges, 0);
+	INIT_DELAYED_WORK(&svms->restore_work, svm_range_restore_work);
 	INIT_WORK(&svms->deferred_list_work, svm_range_deferred_list_work);
 	INIT_LIST_HEAD(&svms->deferred_range_list);
 	spin_lock_init(&svms->deferred_list_lock);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 1d89401f16b4..267545c5ceb9 100644
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
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
