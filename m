Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EF0350DAC
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF216EC30;
	Thu,  1 Apr 2021 04:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998FC6EC2D;
 Thu,  1 Apr 2021 04:22:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FcNwPcdCsULd9YXZylbMjVYkSfnfDvBaJfcw1HaUW80lcBZ8xfx66k0FuehO+mLKYT+Uewt6Lu2gxtFJS+W1y0x4RldQrCjxz/P0HORkN8iyQUgxpQAKyVAjXAAj5PLXwAJlYKQTwipsYJD5gHzOpoA4OYQBD7+d2gXpmjPituTByWMClFOGXyROccCs47F+VB1KnpE+t1YMWuCqwn1Tj7mVFGlJzvwkaDXhSoo80qn2mWmExDP5DITF2les4ssLtHRn9tMcy/IFV1/zNG0m/Vc2H03/ipFMHuOGSwEv3FsTxYM1k7O+15BuKAho8EzMy+KLAA2h/8mEblX7MhE42w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfMaUsqoXuusjAmlRdHnu40LGHUNiYim6Inn6CkO5LY=;
 b=Bhy2gPFFo5DcLdMb7a7qcj4KFss/hLTXO68mx53lUTgr4isgzahvMUmHrHneqV2DorDHhCsCRkPonxskLMZYu6IULq3jGxHF5mJrWEdegKKYk7lQqO9ZLd9ohuPxbRLDcs8JYE/XCq1N+ufiXuqaefJSBcmSX0qE7sH0nI5JYXUs5tcavWrpvt4iLHuJenY76HksfyGepzHIGZP2yEe8TmsAN+HZElcOh17yMColnZjYv2tNXN8VK1+V3NTRPTOu7Fg7uiVVC+ZDqoP/DlQS/yiF2Gekniz7ZdX85L0wunuK9Ppexlr1+SmgxdfxUE21LtbEfi3ZBushR+lk/3nPgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfMaUsqoXuusjAmlRdHnu40LGHUNiYim6Inn6CkO5LY=;
 b=vL0WWk3l7aFdcqWyS9vlEssmvKm5sZW/DX/EwYKhhI2PcPT8iaHVp4Bal01uIza6G1/GXdubFQEx/iFqo+SEId8nSgPHydp/9IWcXFmXDKNFc2e9N66DDo2HvNl0mZalDVkYhFEKvKoR0kKwVvvnVM0/F6Hs+4N0kNrLLZq3x10=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4916.namprd12.prod.outlook.com (2603:10b6:208:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Thu, 1 Apr
 2021 04:22:51 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:22:51 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 10/34] drm/amdkfd: svm range eviction and restore
Date: Thu,  1 Apr 2021 00:22:04 -0400
Message-Id: <20210401042228.1423-11-Felix.Kuehling@amd.com>
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
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:22:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb2b436d-3d67-4051-800b-08d8f4c5d03c
X-MS-TrafficTypeDiagnostic: BL0PR12MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4916A27716DDF4B1985C1B38927B9@BL0PR12MB4916.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VQfnJkqKClSnfbsLPlla2Ve49uLZOQV6lM916ycRT8xSNgTH5xuG9zalIgFpkQvWCzmBKIEi9276xco298yq0l7m5tsv9FZl96+KDWh8iSpCm+DBsxFk3PpVjOmhJ5kHDGBZ5DvKfPRkm93eanrNd5/JSYyTueSwuxh+VeVgNls43LIYlXtvYuZH5pSFpmZNCh6ukFHKtLFnS/Ydj23+4F25vnWtXUcu95P0IW2bTCC4bNUH11spcttCQkq63aSO5NdS/lVjXXq4UhJt635HafgmL+2cgCXX7P1Kcr5Fe/9Im7N6NXJHrbnqk0wOjH1V247ilNDfCDvZw4qGZanwIfTmDP9/hgDVcazOFr5r6uuaiQ2eZ9FGGCcRReLCera2Y4SN2q6dvYW0XyhT4/sWumkT5qKZoueXLcGdh3XM+nmizAqomB212VIJys43wSYOrTnbpoMEjihmFJF9KdquM4u9c8VMWEiTgAfppi/ibgQXRj18QPzK/TpXsrEWLsmOWZfbrIUzgu+26FW8yt3ktFIoSnth1qCH03a+BE2+Ft/E/mVrdQGV9PDKclbFVD6rhzVTcjLXEpYhiW9P77AUae3OSer1cDXOrHb+6YDplnhwJf9ew/FKtIMlkwT3x4MoP4G3p8e0sJ33xRrjSVsVV0Cyxn2zULaoI4bJK/hVtow=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(5660300002)(478600001)(36756003)(16526019)(186003)(1076003)(316002)(6486002)(66946007)(956004)(66556008)(26005)(83380400001)(8676002)(8936002)(450100002)(38100700001)(4326008)(52116002)(7696005)(2616005)(2906002)(66476007)(6666004)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3kvoEEBlTvAbTIRzbkfKKqdUBhMQqnnAw8VkZaHfC0Zimp/ojfapeut7v0ag?=
 =?us-ascii?Q?Bx7B0p0yPUWDTF7e4OlHnXtnZM4Xsm0Y74znwLr7HKcNoA479G1h0GFFF+9W?=
 =?us-ascii?Q?zt7EmDhvBdkxYIijTUornTgTE2u62r4x7uMfvRB7PaltZY75ba5VfxenBK/d?=
 =?us-ascii?Q?W2eAg746moOKJf32C8SmO+kJTCvBLxgaVXTaY9ill2eGa18ui0hxEcFwUrOx?=
 =?us-ascii?Q?pxtxY26WxXuwiGfEGswWXiQwoEmzCwshFHOZrGt4HbQF5YM02IJNbp7QiMfy?=
 =?us-ascii?Q?9GRMHxPAx/Fse+QcXepNjVCgKVwY1duF2tAht6f94YsXOiATRSwAH5M0yA+u?=
 =?us-ascii?Q?RhNOw9N4fuKPJy18ZLRqOILD5u7S2z+7VasfH5b2JoZoticWxnZYITGYxoDx?=
 =?us-ascii?Q?T/4GLaRXDmuAgrippV3zqCPqbL9Mk9P3unqBVjc1SCFSIPiuwpY5QsDQbjBb?=
 =?us-ascii?Q?v66mlzsB8R9NURMWOGTbJBzAQr4MNxIXeb9G39GVPV/6ng+ZpXmkms2VnrMZ?=
 =?us-ascii?Q?D8Es2tGIEsxtXTdeHWWic/Zpc0kSe+k6/NKOZ1tnpN+7LCNrENCmssud/dfb?=
 =?us-ascii?Q?+bWBtT4swoMfDWl3gdB6cKwLY8HYr9lFpzdtHtGM52iRyDmjFo26JHbX91oV?=
 =?us-ascii?Q?rSs4JicS8gT+pyHnzJIjE4KmGW/CqHD3q1LBWMISzpJxlqBR0jY0EJ4uelXL?=
 =?us-ascii?Q?OLa6f3Dho14ZE7M3XxRRww7UkImLaM/KSJwNcdamdK7/fPnkrQFt3NtmluUF?=
 =?us-ascii?Q?GRRFyEj6ULCYaxVblM6kJfPHAiXEf0+uUvctDAgNuHGbdIABTuBGqh7hbaRR?=
 =?us-ascii?Q?lm/c701HVOoMM6sQe0BkQc8VsbTMfnr4Irn6GG8TGBcQQfth/MmoqOxw57Cx?=
 =?us-ascii?Q?FMVdTtNBkoP7p/5A37Lx4Iva5ZJaKo2fi74lRXP6uHOobhbJ/bO3fRjydioI?=
 =?us-ascii?Q?wM3VkQSV5Qg2KK0baMLrzUUU3FGP7TqhntnXH36ZnJbxt9k9dJ6SgIllecG/?=
 =?us-ascii?Q?iLlUN/wd7xz/ipNhfINbdQV4HCdHKzKSNklspihUcHjuDnYoKAKyFm12V+Bx?=
 =?us-ascii?Q?gLtWIsPOxk1ys0+CLdmeNTZJ2o8MCM4DX1klDnDQ+TILFe9gkifB7dy4b4NL?=
 =?us-ascii?Q?xgl3/Bvq6DClb9O1+Q5f2862KF02vgW85hcmVWHpdk/DtbfL3awuXZw3ePqE?=
 =?us-ascii?Q?OJGbS2POSdprxAzRX9VZWsGQqG5qvdJeP1hqFJ5UM/DPl1NUKWMf0Lt1rClr?=
 =?us-ascii?Q?TFXxrIwapavP45Q3WuZPCzD3tQYgt3Pa17U+KFBvfp9obQZHMVI0lA1FiSTz?=
 =?us-ascii?Q?3cmSKGNsfQdbmPYI/VqPB1CX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb2b436d-3d67-4051-800b-08d8f4c5d03c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:22:51.4894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9CZiabBU7UFIRz1yrnunYNpMS45zDCtzYrkAY+obULRbSWtGfFWpHMee+/L8qwJX1A/7pXb2bCM7xzhAcvHVwA==
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
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 137 ++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |   2 +
 4 files changed, 141 insertions(+), 1 deletion(-)

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
index 4736fe996feb..b0e0b243754c 100644
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
@@ -1336,6 +1463,11 @@ svm_range_unmap_from_cpu(struct mm_struct *mm, struct svm_range *prange,
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
@@ -1366,9 +1498,10 @@ svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
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
 
@@ -1389,6 +1522,8 @@ int svm_range_list_init(struct kfd_process *p)
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
