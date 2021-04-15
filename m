Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC2735FF51
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1536E9A3;
	Thu, 15 Apr 2021 01:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680075.outbound.protection.outlook.com [40.107.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD566E9A5;
 Thu, 15 Apr 2021 01:24:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E4lvycy6ZNDpe2Ky2B96uj1thqDj3Gvob7clSdmc9tbViYxkZBnwIVpvKK8ez/hSGl9J9swbI/KpqJIMkNk5a5SdCPhE5OeTNpaRW/BbA3gX1ElkMPF603G4eZbRQCED38wbKYlbgXyso4sGoYnGrS3BngbvKwrex2oZ+hLnE4BXxzp6x9kc7Sl04DEBjOUiADJVIU0iNvQu+Q51Ir9j9sfqA7hG0VXXaTCDNgQZg3JcTVP2W3MaQlgZ8msb09WiiNHG+NXgaUShTJbXML2O+Tugd+Yj/n0nTt+2ciy9Z13xOmZQ82RCCskjqNw60y6n5KOdn7sGBgE8dZZWEPPqXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6ppHhGR2O8zMumzSVvNSivGQdEAWoIutGprIu4Pv2M=;
 b=E5zRd0kzdsrRpKqXjUI3vWg89EjusszClXiFLNJZInFLiRDkV/spzEn4RCABYQDv3/kek8cIh+lcGpDjoHY6I9/4TgfaHgzO0uXbJDKSpgvWVK40ljeSej1IDxzZgwx5JVwVljgp3y4M83/3j3Z2YByBJxv7NxaFpvUtrZyjBBg/S4XEOw8T3m+ap7rIx4e/gajsuRWbeHUXytRgCNAiSC8LfZkWxsOxHjsO4VY3BT9730+8pH4ka5JxfB1KODVekQjEfDAUOB82HaK6wxJVurUOLLY9AsYpD0UWZAWw7nOkPpZQGoqyezemYNzTL7s3hhpmwErEfN7tVCRamwlnjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6ppHhGR2O8zMumzSVvNSivGQdEAWoIutGprIu4Pv2M=;
 b=3Ou/u6wICQcEpNdCTDm2pqx9XPdF1E3jfc9Fes0Qb1mHNjzqbzlgtcqIUDRLBvD7u4DishoraHP0LTE46tZ8hIXO73lzhdA/tgYtMJStzU0QjhmwVK+wQ8sOmJs20FfqND3KCi4ySs0DW3CjOe4QxPvMnL7kQ4aQSdCE0I87dD0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4797.namprd12.prod.outlook.com (2603:10b6:208:a4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Thu, 15 Apr
 2021 01:24:01 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:24:01 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 11/34] drm/amdkfd: svm range eviction and restore
Date: Wed, 14 Apr 2021 21:23:14 -0400
Message-Id: <20210415012337.1755-12-Felix.Kuehling@amd.com>
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
 Transport; Thu, 15 Apr 2021 01:23:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c8b8c00-6c88-4040-7a9e-08d8ffad25b7
X-MS-TrafficTypeDiagnostic: MN2PR12MB4797:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB479740C2EF0D67F2AC99DDD4924D9@MN2PR12MB4797.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PuLnuhHeO6aqWG+5Ak2Ye8l/J+kz1o7u5gahfrLlFglHuh+LkTIkJG/yzgH6N8Np6mc+6FpD1KtMVakZO2VZ/J+b023SrhX3g42BrgYjMN9MbUnzSLI3iCRSPq6udZQ3LTllN9inDaps1OiKfjcZELb1S8sHeBH5T7jz6kDQxrsXBoXuDSg102cOTLzDslDq3qPAD5nXoLEJnU56bR4Sv6NrIkv4YZUoUPON6eZK2SHLdogv6RR2maHEKD5ArwI4+9ULORpVz2jZbAcmtc5XG+OupwVlHF6NDHxM/RQf3mSXPRnnChBjK2BqYJ5Ptc/uzdUBr4aYAvhndUQM764FLsw1iD2MWKNq3OHO7b8C2yDotDGAAXqZ36TrhejvoqpeRiJrVtt+W6p+aJUSykuifFOOavCfG65y/xZiNWtSELwt1j6vDrMtZWz2NaS+8PQLJk3LcWuxUe1qzGaWU4nvghc/z38/WzO8RUeqZQ41dCtdltvTx8E56gIT3Ro4CnrN4GJsm5g5Vfap1Buav5DhtDbVMYqGpoNc1ieZzfp2claMFd3c5Xw2qMrHkKI4/IzqmWupb4lYHgBO00SNlq94EwmUrdBaHyq5u/2ay1XJ7rtW6PlthwdzE8La3FeIi+5XcG4lW9yyQ37+EZzW6kgn+Tvqxvv1uFodyxcr8qA15Fw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(86362001)(66476007)(66946007)(2906002)(38350700002)(186003)(36756003)(16526019)(450100002)(38100700002)(5660300002)(83380400001)(66556008)(4326008)(52116002)(7696005)(478600001)(6486002)(8936002)(2616005)(8676002)(1076003)(6666004)(956004)(26005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ixrSKZUouOUCyv5ukp9z6fpxyUu0MuYKeD1uR/TGaQwU0kpvoXkfo9AZV3BY?=
 =?us-ascii?Q?BRzFaEDZsLGnpTy2ScXG21GUeLC12qERcGygGLitUoT3ZGqrX6muRwUjjL4W?=
 =?us-ascii?Q?STmN9xhWfgFbU3WFTPsw8sSzgougmVRmpRUnrMPeUAp48t8dallgDV4Xl1ps?=
 =?us-ascii?Q?KM6F0j6SXTg0H84+4AfsYnjlm+CZ1S9iW1Seu3lvmIeM4noCWBPSFQQDVR5S?=
 =?us-ascii?Q?7ThEjDgVAhcUTwNbNeh3GvW1R8gFI1K+daOyUjDvB0kXxaPLjDWbgwpXqPL+?=
 =?us-ascii?Q?KF8vkhWMZY22E0w7PrQv2GIM0qRTHkc/cibvvHmZ5blV8/my9vYRVkzVyCr6?=
 =?us-ascii?Q?/pDxBeTX2FMURJvz7o1jOsf/JUlT1udy1kJt8BCLB0flUwwNfhoUH4jpAxZ6?=
 =?us-ascii?Q?D9luJsP/O5KaDwpdkJlBdZ2/w/c1WlbCU8/N8vFMnS7tfY3j0BLhTZJGsTHG?=
 =?us-ascii?Q?81Sos2jUl9IzpYaz1qvqv55lW37QzAuKcaNgR+TyOf2nm/I6b/+t5ELyKVyb?=
 =?us-ascii?Q?90e2+RkqcCT3dTbj7XF2j47rrIA/pEgc2fpBcaLzdYQ/3tRchaEsipVcmiJL?=
 =?us-ascii?Q?kQmMVCnIqgwe0a3PhxQrBUhk00HVvc0Fr9pkKg9xV6AAqtZQOAfXvp7zWOM7?=
 =?us-ascii?Q?IZgpSGBXK/kVvddrsrr7i6rw75ngM+pRmtrBd59nLnt7K8LX30YMgB7jo1X1?=
 =?us-ascii?Q?PWlbqJQO4loYeOjTSQLtwa9Qejb6SKCFZG6tJGXH4r2tSkQqEdy5XKrD43kt?=
 =?us-ascii?Q?7Jsi1EA7YLDCNwRmc7qS5IwXw7vsqmRB897E2vBTTFlbGmj21zkoedW7CRNf?=
 =?us-ascii?Q?AfMa7caOvSR1WJXfrq8aJ3/ZIHRJtFQfI2skaaoEaj2lbuLaWrb5b5Y0DdEm?=
 =?us-ascii?Q?z/TT93l9pyOOEzUP4E4CRS7InCh8AfG6IMBnXW7ZOVwpvtWioHLBfgJ2ehI+?=
 =?us-ascii?Q?Vw2apjAKWEESiwVsJlT1ZeqMsVHbJTU0zHgplyvfQx/+xlKbazRKVKlYl0Ao?=
 =?us-ascii?Q?4HwAozWVxsYJgFfFsK937mlJ1LMecPt0ip4DarLFldjdS7ntclsrzH27k9nk?=
 =?us-ascii?Q?NY8r0rLiyViaNYb8as3GVzojQTl0b2Ml5m48x31DCuhTPt90n+zxrDOPdMLL?=
 =?us-ascii?Q?ib1q9zv1m7oQSDIVn6815FWP6l6nywxo/AXtEwoZQBXRX8S54O3tUMlcq17n?=
 =?us-ascii?Q?i3zbJLzAEkSzRuDh124Dv2t5VnEPyqO05RO/xaXo9l7PuzGjXS5lLylsafBS?=
 =?us-ascii?Q?XzjD4Kz51I4asv0DXyhnwQv+JChFHjTYuuRVSrzTEbpPC0hNxU8kjv7OcaIp?=
 =?us-ascii?Q?tLR0wPhfE1ZtiacCk4YEkGAD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c8b8c00-6c88-4040-7a9e-08d8ffad25b7
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:24:00.1585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hrD+zzTn+ohjc765oNPWvZcC0Hve1Oqk/Px62Kb7u0VIqhEpGnu/3gQ07cuyvEj2TO9Sz/4ONkdnjIcfgll31g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4797
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
index 55ca39fe46a8..1ffdc2422d67 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -22,6 +22,7 @@
  */
 
 #include <linux/types.h>
+#include <linux/sched/task.h>
 #include "amdgpu_sync.h"
 #include "amdgpu_object.h"
 #include "amdgpu_vm.h"
@@ -29,6 +30,8 @@
 #include "kfd_priv.h"
 #include "kfd_svm.h"
 
+#define AMDGPU_SVM_RANGE_RESTORE_DELAY_MS 1
+
 static bool
 svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
 				    const struct mmu_notifier_range *range,
@@ -251,6 +254,7 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
 	INIT_LIST_HEAD(&prange->insert_list);
 	INIT_LIST_HEAD(&prange->deferred_list);
 	INIT_LIST_HEAD(&prange->child_list);
+	atomic_set(&prange->invalid, 0);
 	mutex_init(&prange->lock);
 	svm_range_set_default_attributes(&prange->preferred_loc,
 					 &prange->prefetch_loc,
@@ -963,6 +967,129 @@ svm_range_list_lock_and_flush_work(struct svm_range_list *svms,
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
@@ -1331,6 +1458,11 @@ svm_range_unmap_from_cpu(struct mm_struct *mm, struct svm_range *prange,
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
@@ -1364,6 +1496,7 @@ svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
 		svm_range_unmap_from_cpu(mni->mm, prange, start, last);
 		break;
 	default:
+		svm_range_evict(prange, mni->mm, start, last);
 		break;
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
index 5949890bf48c..3c94899c5c40 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -67,6 +67,7 @@ struct svm_work_list_item {
  * @perfetch_loc: last prefetch location, 0 for CPU, or GPU id
  * @actual_loc: the actual location, 0 for CPU, or GPU id
  * @granularity:migration granularity, log2 num pages
+ * @invalid:    not 0 means cpu page table is invalidated
  * @notifier:   register mmu interval notifier
  * @work_item:  deferred work item information
  * @deferred_list: list header used to add range to deferred list
@@ -97,6 +98,7 @@ struct svm_range {
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
