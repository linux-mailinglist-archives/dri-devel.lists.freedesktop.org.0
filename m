Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B543A2EC8A4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:03:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7DE6E42E;
	Thu,  7 Jan 2021 03:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FB16E424;
 Thu,  7 Jan 2021 03:02:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6Jghdq3s+UaMMs6AYTR6qq58VpfnoxdwvF7C2F2G1N3dPFjyhyjT+oyMBdb6wkapfq3pF4Va0wpjaqiThqfo4jaGYx9k4QQ78sXen0ixJQ3iJ1hpJndXg/T29FSMw3PAymbJiyJ+W5Pg/UMupJO4EOMQOHGOy2B8sMt/YgRNPhEZ0LuxP52XY5ayIRamd6qcsoxymBD7GbRjCY4wS+giZhYcW7Z1Dtk4cs9Ua9IS+rgAofu+Rvu3b+WGR8eqZnBJ8AjMWx8E3gpvXzWxl+vgXxPV4cMqoBpu1sWykzSgWmJp+hWFlwfyGRW2pdArXaSAOaKkg6OkXxYkSBn6TUyFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ATb1jw7wYktzUuqqpumC5Q/j5LaBHNOlcF3HJyfolDI=;
 b=K2GCvdMbU7PjNpZS5qRAL7zG9NCqcAMjU8b/rERFH1WnMrh/CgdjXfLZJf2YlBpwPZjk8B9EsBNkBbXpbzJZlyDjR5REAUsb/YaFbPxgw9/GS7VKKYE7o+DslvADzan/P6S9u9IHoX5IzDFk3TcqSECbhL882Ao/8rOZRXCtRcMkbtA5ieADjeqP+bxp+XTbMH4U9mkILrzysJ4bqriZHsmrYRqPmwQNGh6rZ7M+FosWezDMG2YXrruueYEpa2nz7isshL/EiQ9puVkcmtFr3aVfMSl4udJ4RWvAb/y3msOk5XH/EZJO8941ZMQklbQ8ygrFD/hqHTbDzjDJ2gF4kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ATb1jw7wYktzUuqqpumC5Q/j5LaBHNOlcF3HJyfolDI=;
 b=2P5Fs+w3kYZ8GkSUpPZS5RBCgthPESvP4T9bV/VTW7loaeIfp4pukMuNOKSngmRDX/gn/mBWV83KPyShqSpPGWmXsfna3D9nZgQ06zP/ONHQEP7wsXSBFgZqJpLV99rq2FIs6X88Ybl4tNhpAxWVy33QKXc2LqVCXPS2oycWqZ4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3999.namprd12.prod.outlook.com (2603:10b6:208:158::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Thu, 7 Jan
 2021 03:02:56 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:02:56 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 14/35] drm/amdkfd: svm range eviction and restore
Date: Wed,  6 Jan 2021 22:01:06 -0500
Message-Id: <20210107030127.20393-15-Felix.Kuehling@amd.com>
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
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:02:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f48960fd-8881-40b8-c188-08d8b2b8bbac
X-MS-TrafficTypeDiagnostic: MN2PR12MB3999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3999C615D21EE8789D3D901192AF0@MN2PR12MB3999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4qdeqo0BneGpmYsKNDtQ0QYn4BgpP45C9inAOHMk5pLJH/9tDco5qbv/5PpUkPa8wMgcBgpOCzCwFJklgYKqaZ/z8yJclGQRsxc3QZ/2cTEX8QN2fmzHWdl9A3Ib1AFYU61pZlVMB8iwYScQjaDpjRvfmghu/sUTwJVUeHwTyahUXxhZRE56KLcDUzxAumPzl2QPW3/hU9/v2eMM93lLngWChNdbdnlNNfoUVg74V8DxEH2363o1/BU5v6ARyC+9uU9SLegCnfXKLqpms6D9b+/o4uSvebhseG0A+K0iAYUb8plTlVpGtIeBeyRdywEOyMqXZFyAbT9HrxJJ7WWADFueteDbvkBUbNUiaTwXSgTy+VoxwKvd2L7KR8nUCZQ6MLqmpN+fH1rS1EqchfbF4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(316002)(6666004)(7696005)(2616005)(956004)(8936002)(4326008)(66476007)(8676002)(478600001)(5660300002)(26005)(52116002)(1076003)(86362001)(16526019)(66946007)(450100002)(186003)(6486002)(36756003)(83380400001)(2906002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?EaminQR0lYN3Tv2+wNYW+21sVodoxuivzHyv+o6zX/baii6DFEmSh0+F3UQg?=
 =?us-ascii?Q?/248T9ZKqpduJZ4w21l8Hc+09PKcy3/JsUMFN1yozSRy2/bkfayC/fIRMd5Z?=
 =?us-ascii?Q?YdGhAtckmYJwM20VLd2+rBdJkT+5Zz63PZgHTQkRLjDxoTLYtmN8TD+VvfRQ?=
 =?us-ascii?Q?XNoj/dM6siRTVObN0lPR5lXsaAmsjX8r7gDFvsZcUafp1JA8X8JrgKQ2wEb7?=
 =?us-ascii?Q?WYJSK7vL43+3WHg+aOxtYtLKFegMHi0kFZkEWSTfzrh0d1NOt49uksNxDE4g?=
 =?us-ascii?Q?22sB1XEyFTaJDKLCBmulCtfQK74laSZitSw1MSJDL8JhBjOgpYJ5fbGF8YrT?=
 =?us-ascii?Q?jLjjph90MuoL1hmrFemwTKs6Mx767rZNd2t5uquzOScooJtBEEkPJEtWBVfl?=
 =?us-ascii?Q?mC2KG+LbUo9PUm9AN3u3obigxvWFyX1XLKg0I0Qg39BDiztHRJgp+DbWHT28?=
 =?us-ascii?Q?7ufj3uIfW8C+j3p2i84Oh+BgrxX7EcwFtltM84l068PiulQm7io17r5skj+6?=
 =?us-ascii?Q?rk5R2uGJddNcT4CrQ4M236E6h4A7e9z3hiSPpNivHETJR4jHr6h5WTGzMVr+?=
 =?us-ascii?Q?/dqeVzKxQK/OJj9LrTp4T29k56Qx2scVwUVYZmAXAX/xkVYX8xsT/eqtZ3z1?=
 =?us-ascii?Q?0iJN7FhhJjb5+J83ALKIye4q4rFtJWNczEIPpl2laXKb+a24deRCXaI2N9MU?=
 =?us-ascii?Q?qYN5/t3zWFPMJCs53LvZA1sxAjzyRnRTK5YAhkjes+5pbn38O0LdSLV1Qd9Z?=
 =?us-ascii?Q?MhTByk1w86wNP5+6nEXEklZkvQ7kNlHgzYgOIOTTII15QahaPYAgn7Two9lu?=
 =?us-ascii?Q?zf8zbsgyDudW1Zzl6x32Hi1ZAemr5jfn1BD+jG91ski8DDCiM8IAgh5sGPQM?=
 =?us-ascii?Q?IxPt0yYqn1oN791I24fL0OmWP319tq29vdXLV4jNUW9Crv15gQCQp9F16IMx?=
 =?us-ascii?Q?KANeJqbOYRw8wjmP/Cv0/9y0xER8BrraExLJRK8hJub2AHcWvtdXRg3/rN1b?=
 =?us-ascii?Q?mvOh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:02:56.3271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: f48960fd-8881-40b8-c188-08d8b2b8bbac
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bxGJUFMurV2yCh82uffkOzhUm0po99AcuWyy668/79MSfHg4utlEpDOgvCLYBtEcprxnddGRAy0Op092oVfQzw==
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

HMM interval notifier callback notify CPU page table will be updated,
stop process queues if the updated address belongs to svm range
registered in process svms objects tree. Scheduled restore work to
update GPU page table using new pages address in the updated svm range.

svm restore work to use srcu to scan svms list to avoid deadlock between
below two cases:

case1: svm restore work takes svm lock to scan svms list, then call
hmm_page_fault which takes mm->mmap_sem.
case2: unmap event callback and set_attr ioctl takes mm->mmap_sem, than
takes svm lock to add/remove ranges.

Calling synchronize_srcu in unmap event callback will deadlock with
restore work because restore work may wait for unmap event done to
take mm->mmap_sem, so schedule srcu_free_work to wait for srcu read
critical section done in svm restore work then free svm ranges.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |   2 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 169 ++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |   2 +
 4 files changed, 169 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 97cf267b6f51..f1e95773e19b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -736,6 +736,8 @@ struct svm_range_list {
 	struct list_head		free_list;
 	struct mutex			free_list_lock;
 	struct mmu_interval_notifier	notifier;
+	atomic_t			evicted_ranges;
+	struct delayed_work		restore_work;
 };
 
 /* Process data */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 791f17308b1b..0f31538b2a91 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1048,6 +1048,7 @@ static void kfd_process_notifier_release(struct mmu_notifier *mn,
 
 	cancel_delayed_work_sync(&p->eviction_work);
 	cancel_delayed_work_sync(&p->restore_work);
+	cancel_delayed_work_sync(&p->svms.restore_work);
 
 	mutex_lock(&p->mutex);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 3c4a036609c4..e3ba6e7262a7 100644
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
 /**
  * svm_range_unlink - unlink svm_range from lists and interval tree
  * @prange: svm range structure to be removed
@@ -99,6 +102,7 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
 	INIT_LIST_HEAD(&prange->list);
 	INIT_LIST_HEAD(&prange->update_list);
 	INIT_LIST_HEAD(&prange->remove_list);
+	atomic_set(&prange->invalid, 0);
 	svm_range_set_default_attributes(&prange->preferred_loc,
 					 &prange->prefetch_loc,
 					 &prange->granularity, &prange->flags);
@@ -191,6 +195,10 @@ svm_range_validate(struct mm_struct *mm, struct svm_range *prange)
 
 	r = svm_range_validate_ram(mm, prange);
 
+	pr_debug("svms 0x%p [0x%lx 0x%lx] ret %d invalid %d\n", prange->svms,
+		 prange->it_node.start, prange->it_node.last,
+		 r, atomic_read(&prange->invalid));
+
 	return r;
 }
 
@@ -757,6 +765,151 @@ static int svm_range_map_to_gpus(struct svm_range *prange, bool reserve_vm)
 	return r;
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
+	int srcu_idx;
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
+	mmap_read_lock(mm);
+	srcu_idx = srcu_read_lock(&svms->srcu);
+
+	list_for_each_entry_rcu(prange, &svms->list, list) {
+		invalid = atomic_read(&prange->invalid);
+		if (!invalid)
+			continue;
+
+		pr_debug("restoring svms 0x%p [0x%lx %lx] invalid %d\n",
+			 prange->svms, prange->it_node.start,
+			 prange->it_node.last, invalid);
+
+		r = svm_range_validate(mm, prange);
+		if (r) {
+			pr_debug("failed %d to validate [0x%lx 0x%lx]\n", r,
+				 prange->it_node.start, prange->it_node.last);
+
+			goto unlock_out;
+		}
+
+		r = svm_range_map_to_gpus(prange, true);
+		if (r) {
+			pr_debug("failed %d to map 0x%lx to gpu\n", r,
+				 prange->it_node.start);
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
+	srcu_read_unlock(&svms->srcu, srcu_idx);
+	mmap_read_unlock(mm);
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
+svm_range_evict(struct svm_range_list *svms, struct mm_struct *mm,
+		unsigned long start, unsigned long last)
+{
+	int invalid, evicted_ranges;
+	int r = 0;
+	struct interval_tree_node *node;
+	struct svm_range *prange;
+
+	svms_lock(svms);
+
+	pr_debug("invalidate svms 0x%p [0x%lx 0x%lx]\n", svms, start, last);
+
+	node = interval_tree_iter_first(&svms->objects, start, last);
+	while (node) {
+		struct interval_tree_node *next;
+
+		prange = container_of(node, struct svm_range, it_node);
+		next = interval_tree_iter_next(node, start, last);
+
+		invalid = atomic_inc_return(&prange->invalid);
+		evicted_ranges = atomic_inc_return(&svms->evicted_ranges);
+		if (evicted_ranges == 1) {
+			pr_debug("evicting svms 0x%p range [0x%lx 0x%lx]\n",
+				 prange->svms, prange->it_node.start,
+				 prange->it_node.last);
+
+			/* First eviction, stop the queues */
+			r = kgd2kfd_quiesce_mm(mm);
+			if (r)
+				pr_debug("failed to quiesce KFD\n");
+
+			pr_debug("schedule to restore svm %p ranges\n", svms);
+			schedule_delayed_work(&svms->restore_work,
+			   msecs_to_jiffies(AMDGPU_SVM_RANGE_RESTORE_DELAY_MS));
+		}
+		node = next;
+	}
+
+	svms_unlock(svms);
+
+	return r;
+}
+
 struct svm_range *svm_range_clone(struct svm_range *old)
 {
 	struct svm_range *new;
@@ -994,6 +1147,11 @@ svm_range_unmap_from_cpu(struct mm_struct *mm, unsigned long start,
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
@@ -1009,15 +1167,14 @@ svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
 	if (range->event == MMU_NOTIFY_RELEASE) {
 		pr_debug("cpu release range [0x%lx 0x%lx]\n", range->start,
 			 range->end - 1);
-		return true;
-	}
-	if (range->event == MMU_NOTIFY_UNMAP) {
+	} else if (range->event == MMU_NOTIFY_UNMAP) {
 		pr_debug("mm 0x%p unmap range [0x%lx 0x%lx]\n", range->mm,
 			 start, last);
 		svm_range_unmap_from_cpu(mni->mm, start, last);
-		return true;
+	} else {
+		mmu_interval_set_seq(mni, cur_seq);
+		svm_range_evict(svms, mni->mm, start, last);
 	}
-
 	return true;
 }
 
@@ -1045,6 +1202,8 @@ int svm_range_list_init(struct kfd_process *p)
 	svms->objects = RB_ROOT_CACHED;
 	mutex_init(&svms->lock);
 	INIT_LIST_HEAD(&svms->list);
+	atomic_set(&svms->evicted_ranges, 0);
+	INIT_DELAYED_WORK(&svms->restore_work, svm_range_restore_work);
 	r = init_srcu_struct(&svms->srcu);
 	if (r) {
 		pr_debug("failed %d to init srcu\n", r);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index fb68b5ee54f8..4c7daf8e0b6f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -50,6 +50,7 @@
  * @perfetch_loc: last prefetch location, 0 for CPU, or GPU id
  * @actual_loc: the actual location, 0 for CPU, or GPU id
  * @granularity:migration granularity, log2 num pages
+ * @invalid:    not 0 means cpu page table is invalidated
  * @bitmap_access: index bitmap of GPUs which can access the range
  * @bitmap_aip: index bitmap of GPUs which can access the range in place
  *
@@ -72,6 +73,7 @@ struct svm_range {
 	uint32_t			prefetch_loc;
 	uint32_t			actual_loc;
 	uint8_t				granularity;
+	atomic_t			invalid;
 	DECLARE_BITMAP(bitmap_access, MAX_GPU_INSTANCE);
 	DECLARE_BITMAP(bitmap_aip, MAX_GPU_INSTANCE);
 };
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
