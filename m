Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDE5350DC3
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCE96EC42;
	Thu,  1 Apr 2021 04:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BA66EC42;
 Thu,  1 Apr 2021 04:23:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZJE5L1nJ4qGNdDjrQe20tGkKeeOXemKGtFqI0aTwuLunsDvUYxvO4wcG5kpBjmBCoMPMVhLeQdxUG3f539WGMXiVFi/0ubW/2ikHlRC2hZp28ApkvftYq1ef0qNCw0CGHlKMjDl/jjLZQ0XRin3zXA/y9RyCiID6vzfcugfrUPUHrtqhFiHE6Baa8GEEQmLbFkDJsJ+S42561BMkPnuB/S8zge4vJT0sLVkc7mX1w5MAkFTNanOd/xQLEkFygj6EYDX6iXJhmk2OvYYV8RFHGhzcs38ZR+nGcOHvvJ+NAswEm0sIAhLtH72oGJQFPzSQjM88f9XvRWabnBQ8KKfDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqYMXM78Xk9XFYNy3lEyhulak756dITHPZDF9dvBwAQ=;
 b=S91383YWWNzhiRsjTtr0zv21VekmFomYh9BF9eL7lzhrGVe1Q/dE9sFxGzqaM4ODqDYeMeT7fYKYjEQxNUqSfP4xCqQldOxSWidTyuZyeSsNIXY/4QyY4rZulFwoM3qPNlIr/jVAhjCczR+d6BXXBKTeI8qras5hbvIwxS/US7HVaZKp46AdSLOe0IdYe1qomfQqb6m9NP6g3tFNya3quVKS2vWzprB+fOeq4/B97/Q/LDYkahExqgTLwa4JSYaNTwgSTbpEa5msby6XAwBmWV/xsUvyiSOmqLrp1JDHa4m2MBZAA6w7u0M4nwRa956umQpz8w0b4IsNJKyie4jn7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqYMXM78Xk9XFYNy3lEyhulak756dITHPZDF9dvBwAQ=;
 b=L1LWBQTGbx8R707PyNRGpTQM45K12SGZWQAavBSrs/2UHyRZpXCqeMK/yN4CVUbaWAK5TYs7LsYzPCzEHhTqqikC1pddYKtZ8XSy12KKlgZYt2ZRnS9z4qrGJXWPjjG6u/QoDrgmhOde7lQy1igoTI3qAEmalrnrJ4wWh1U31lg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 1 Apr
 2021 04:23:01 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:23:01 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 20/34] drm/amdkfd: invalidate tables on page retry fault
Date: Thu,  1 Apr 2021 00:22:14 -0400
Message-Id: <20210401042228.1423-21-Felix.Kuehling@amd.com>
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
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:23:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d079fd4-f062-4664-f32f-08d8f4c5d61e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4222:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB42221C4E3DCC2FA070F8FBC3927B9@MN2PR12MB4222.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MySvwcbJxPOirqSfe9r8hpgKVv2euVlZZgXT8gZN5GIxItnp5qH4qJYIGF9d+DNkyuvSxLMh1xIiUw7E40yKYwZIW3Tj1tXmKxAxDThubMF9ABe8DwHvmyQMpc4HiIk63f2KfDRSQ1HcJI/EivXKtDXT+RDPHkd7pNkuSv4aQCYx9vB/4nS8hMARLkUQhtVzQ6WHKyImqhCdLQI5IqVcWSqXQaW72L4W+WnjrghM4tK62NwJlxsEaUYeV9g5n5kv90IzYhRt6kQzavku5JCZqoEX6NMJEQvlytbn8VyfTIe4QIl0bRkybw+lSolfkOmqX49T+urUTzi8sOGk3mRtX1QTUZBNt6/2Xi1bmFStID+4Y+ujkBWhobAwjkGP+5XwzhniAIvPp1/KiIIT8yhqNYAKyly1oDLk6WbqCwbl2bBJi/FeqhMZE01F0nbfDpH/7d26t2EyOwRgRuR8oW0p1Kqd9Kav33H9P+R3wfHo+QyACSHO8a8/OkL7hprAl4eVvoz2yAb5t5i9WKQxWntgns3ey2sWcX9hs9xShkOMaFf1zQEN5sXq/g53dfBvjdRNc3kd6AhAF7c02lVKhJWwr01s+6qY5DGjTNqCfdgYGQZer4NdnZR54bHnmFo34TIAsUngd1SOh0jTgynpAQRJiUHfTdAIabBQ9xJIc5mpQho=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(1076003)(316002)(52116002)(66476007)(38100700001)(2616005)(956004)(54906003)(5660300002)(2906002)(6666004)(186003)(16526019)(4326008)(450100002)(66556008)(8936002)(83380400001)(36756003)(86362001)(8676002)(6486002)(7696005)(478600001)(26005)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?L+8Al3n46pH29T+/+bZ8B2w9mRITuuGxx7EK/zLe4gLq2dmE9lGZ2NUuDU+q?=
 =?us-ascii?Q?BM8HwzwCq+3NXGRp6u4mVMCW1st/6VRg1/osY10yecq84G45zqfCR1E3sEln?=
 =?us-ascii?Q?G/Pc77nySqgRxrV+nqEJv7OPOR5RkwV5+ONJmWAsJj3FRX5VNg+rTxyhPGvZ?=
 =?us-ascii?Q?olTWaLrsq7TurFwp3QwrUNBE+OGFwN7QgrdCcXa+Eqxlwu6UQB5f43H8ndVA?=
 =?us-ascii?Q?URNP41+PyYSJIRQGkGAZGU8IW45OXKRLr3pLXwModhs26UNVPbLzrcx/5lPQ?=
 =?us-ascii?Q?aimjGK+TMLhjNWPHUKHQW3/jYFOXWLxCh6R1b7FwBosAZtlnHK820GN18+NX?=
 =?us-ascii?Q?kcgqjhKphVTv2x5oroPQvsyfT8lkJMIl7755I+0/foKJyemDB/w90gZ13KpX?=
 =?us-ascii?Q?tmZfnkDMArkgNKvakMwvxz07DRwyCHkWwVhDPd9o+9KSe775/5RoNjVkLhTY?=
 =?us-ascii?Q?K0GZkSS6E7PyPTM/WdOvNaOk5lAcSnVLyIC7z3sfoq3glKmEmUZiuTOh1UG0?=
 =?us-ascii?Q?30iLw/Xi44OcMYbBhRJ2192gJRX+go5DU0g6LHMAQ0OKznsscdZIe6RfhKxY?=
 =?us-ascii?Q?LvHdwX6LYJ880YcRAL49K5inOYK4eDNcC7MZN5oKRYN66wrpEqPG1onh3/jz?=
 =?us-ascii?Q?DjONdbmfl+Pm8ZNuAL5LLVa5GbLkdSNtFgETOVGYWHdPUZr6ISK00PZb7o3F?=
 =?us-ascii?Q?Glf1kJ9ovKxJoeVT8Kqszg/7rVJ+4A42puoXVS3n8Kq20QxrlbMyQjtbsWDq?=
 =?us-ascii?Q?Q49A6pVmZEqsOeLd2TBo7ABUnZSL3JwT/ksKsiSyt8MS1qp3BmYPJJlL11em?=
 =?us-ascii?Q?uIRp8aSVGyxe786XzUeAI320K4JbsqSxXC3+6JSR1LxgW/ohbZi4YFnhNBgd?=
 =?us-ascii?Q?nubf7E5tXtkz44xmhtV9pA8cHjGURWV3QBTDA1nB+wIV/Ms/XGwm02hCJ/dB?=
 =?us-ascii?Q?shcOYKALcHpiGm+lmvKhXx3uXwT0xUP5yoAdg1oeaiziAqOTRI0zPi3B4wLs?=
 =?us-ascii?Q?9Ph6GZL7aZWgcOsZDpenkJ9A6RJu6cyqjLyuLOm8hFBzsHA10LINT8w06Fvv?=
 =?us-ascii?Q?jxoiBzULl4w4lhsFn/RD4zvxFbZonyUxa8kv2zW7bfA9AmpZQ4vwu6CHYTvR?=
 =?us-ascii?Q?/inB496bFyqJrsXnxhix/jyNnPDpbS6shzQkm18U8nC4GYOzK23s8CBbZIbz?=
 =?us-ascii?Q?uGwljTtDKHL8aTeAs8RDFoq4GSN3KuU0O/pRRmy3+HKvKFTvlegzvg529dJL?=
 =?us-ascii?Q?uA78ftkiaW7vhJqxMayzE1YVjGSD+anc2iD58/EGPONuoX/SIT7bOZhl5n5g?=
 =?us-ascii?Q?aiqhyPVfpj2DZSR7CndH6lgC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d079fd4-f062-4664-f32f-08d8f4c5d61e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:23:01.5552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8S9rJ7zYKct7OW1XYflm+QZx+SzPuptpi/kXb61syqN5EHoCvyLO/qZqppyOVkTdk/TMSx6iXwOzqLfacwFOIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4222
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

GPU page tables are invalidated by unmapping prange directly at
the mmu notifier, when page fault retry is enabled through
amdgpu_noretry global parameter. The restore page table is
performed at the page fault handler.

If xnack is on, we update GPU mappings after migration to avoid
unnecessary GPUVM faults.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 79 +++++++++++++++++++-----
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |  4 +-
 3 files changed, 72 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 81bae0adc0cf..552c4f656e2d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -807,7 +807,11 @@ static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
 		pr_debug("failed %d migrate 0x%p [0x%lx 0x%lx] to ram\n", r,
 			 prange, prange->start, prange->last);
 
-	op = SVM_OP_UPDATE_RANGE_NOTIFIER;
+	/* xnack on, update mapping on GPUs with ACCESS_IN_PLACE */
+	if (p->xnack_enabled && parent == prange)
+		op = SVM_OP_UPDATE_RANGE_NOTIFIER_AND_MAP;
+	else
+		op = SVM_OP_UPDATE_RANGE_NOTIFIER;
 	svm_range_add_list_work(&p->svms, parent, mm, op);
 	schedule_deferred_list_work(&p->svms);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index a83a7242c760..7da58a4214c0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -912,6 +912,13 @@ svm_range_split_by_granularity(struct kfd_process *p, struct mm_struct *mm,
 		svm_range_add_child(parent, mm, tail, SVM_OP_ADD_RANGE);
 	}
 
+	/* xnack on, update mapping on GPUs with ACCESS_IN_PLACE */
+	if (p->xnack_enabled && prange->work_item.op == SVM_OP_ADD_RANGE) {
+		prange->work_item.op = SVM_OP_ADD_RANGE_AND_MAP;
+		pr_debug("change prange 0x%p [0x%lx 0x%lx] op %d\n",
+			 prange, prange->start, prange->last,
+			 SVM_OP_ADD_RANGE_AND_MAP);
+	}
 	return 0;
 }
 
@@ -1418,25 +1425,54 @@ svm_range_evict(struct svm_range *prange, struct mm_struct *mm,
 		unsigned long start, unsigned long last)
 {
 	struct svm_range_list *svms = prange->svms;
-	int invalid, evicted_ranges;
+	struct kfd_process *p;
 	int r = 0;
 
-	invalid = atomic_inc_return(&prange->invalid);
-	evicted_ranges = atomic_inc_return(&svms->evicted_ranges);
-	if (evicted_ranges != 1)
-		return r;
+	p = container_of(svms, struct kfd_process, svms);
 
-	pr_debug("evicting svms 0x%p range [0x%lx 0x%lx]\n",
-		 prange->svms, prange->start, prange->last);
+	pr_debug("invalidate svms 0x%p prange [0x%lx 0x%lx] [0x%lx 0x%lx]\n",
+		 svms, prange->start, prange->last, start, last);
 
-	/* First eviction, stop the queues */
-	r = kgd2kfd_quiesce_mm(mm);
-	if (r)
-		pr_debug("failed to quiesce KFD\n");
+	if (!p->xnack_enabled) {
+		int invalid, evicted_ranges;
 
-	pr_debug("schedule to restore svm %p ranges\n", svms);
-	schedule_delayed_work(&svms->restore_work,
-		msecs_to_jiffies(AMDGPU_SVM_RANGE_RESTORE_DELAY_MS));
+		invalid = atomic_inc_return(&prange->invalid);
+		evicted_ranges = atomic_inc_return(&svms->evicted_ranges);
+		if (evicted_ranges != 1)
+			return r;
+
+		pr_debug("evicting svms 0x%p range [0x%lx 0x%lx]\n",
+			 prange->svms, prange->start, prange->last);
+
+		/* First eviction, stop the queues */
+		r = kgd2kfd_quiesce_mm(mm);
+		if (r)
+			pr_debug("failed to quiesce KFD\n");
+
+		pr_debug("schedule to restore svm %p ranges\n", svms);
+		schedule_delayed_work(&svms->restore_work,
+			msecs_to_jiffies(AMDGPU_SVM_RANGE_RESTORE_DELAY_MS));
+	} else {
+		struct svm_range *pchild;
+		unsigned long s, l;
+
+		pr_debug("invalidate unmap svms 0x%p [0x%lx 0x%lx] from GPUs\n",
+			 prange->svms, start, last);
+		svm_range_lock(prange);
+		list_for_each_entry(pchild, &prange->child_list, child_list) {
+			mutex_lock_nested(&pchild->lock, 1);
+			s = max(start, pchild->start);
+			l = min(last, pchild->last);
+			if (l >= s)
+				svm_range_unmap_from_gpus(pchild, s, l);
+			mutex_unlock(&pchild->lock);
+		}
+		s = max(start, prange->start);
+		l = min(last, prange->last);
+		if (l >= s)
+			svm_range_unmap_from_gpus(prange, s, l);
+		svm_range_unlock(prange);
+	}
 
 	return r;
 }
@@ -1639,12 +1675,25 @@ svm_range_handle_list_op(struct svm_range_list *svms, struct svm_range *prange)
 			 svms, prange, prange->start, prange->last);
 		svm_range_update_notifier_and_interval_tree(mm, prange);
 		break;
+	case SVM_OP_UPDATE_RANGE_NOTIFIER_AND_MAP:
+		pr_debug("update and map 0x%p prange 0x%p [0x%lx 0x%lx]\n",
+			 svms, prange, prange->start, prange->last);
+		svm_range_update_notifier_and_interval_tree(mm, prange);
+		/* TODO: implement deferred validation and mapping */
+		break;
 	case SVM_OP_ADD_RANGE:
 		pr_debug("add 0x%p prange 0x%p [0x%lx 0x%lx]\n", svms, prange,
 			 prange->start, prange->last);
 		svm_range_add_to_svms(prange);
 		svm_range_add_notifier_locked(mm, prange);
 		break;
+	case SVM_OP_ADD_RANGE_AND_MAP:
+		pr_debug("add and map 0x%p prange 0x%p [0x%lx 0x%lx]\n", svms,
+			 prange, prange->start, prange->last);
+		svm_range_add_to_svms(prange);
+		svm_range_add_notifier_locked(mm, prange);
+		/* TODO: implement deferred validation and mapping */
+		break;
 	default:
 		WARN_ONCE(1, "Unknown prange 0x%p work op %d\n", prange,
 			 prange->work_item.op);
@@ -2263,7 +2312,7 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 		if (r)
 			goto out_unlock_range;
 
-		if (migrated) {
+		if (migrated && !p->xnack_enabled) {
 			pr_debug("restore_work will update mappings of GPUs\n");
 			mutex_unlock(&prange->migrate_mutex);
 			continue;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 32c87957aa43..6cc12de8d76a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -43,7 +43,9 @@ enum svm_work_list_ops {
 	SVM_OP_NULL,
 	SVM_OP_UNMAP_RANGE,
 	SVM_OP_UPDATE_RANGE_NOTIFIER,
-	SVM_OP_ADD_RANGE
+	SVM_OP_UPDATE_RANGE_NOTIFIER_AND_MAP,
+	SVM_OP_ADD_RANGE,
+	SVM_OP_ADD_RANGE_AND_MAP
 };
 
 struct svm_work_list_item {
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
