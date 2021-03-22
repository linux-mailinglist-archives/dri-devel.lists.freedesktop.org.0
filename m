Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A85343F1D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0BB6E22B;
	Mon, 22 Mar 2021 11:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD306E0CF;
 Mon, 22 Mar 2021 11:07:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQNnPPwF8pLJpii3VtqhJvEIBEmzx7/kcC12deL5D2+fAuU7EvTMhguIO19UN7hmc5g2lFfy9Wrbns3N1TPhYBnSoEwdmpRKKdhPlViDEHu9S6ybTCIb0UCeKIc1xDFr8naMn4jhJEYG4kNvjCRKNdqRP9PWwvl6nUMsmJka07uMQ/m/hqsW5QMH3SOCmFo7E/L2iTyWnmV10I1C5yl3kJB5UCQdU3hHbZuJ2Cx1SsyZU9Yr8C/CYF7cklDDnkv8SziusCgqWlMeqcqNwuJnqQEi5EH4RwxakHoZ9R3DtDsoMvvgPms1qSy/w9iGtZJbnP65e042JliIdN4iwF9LXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkCBII+VppymZAtYCSdLPQHO6WMl8IAuIZ+94tklk2s=;
 b=ihmmUsliWZiVMOs8adVyQkLjcJCKRQFmxYP4ZHg4944H1uL2qX+WOBym/3rm/xmAo8Y00iSsNqQgfANiAbrsOVuTuh3Y2BDlRv3G3J1WhoYJuqEF+/ckTkt1ySXyIO+7rf8qBuPCF0HeYpKeL7F5/O9BQAn9jI8febb6Ap7bISMV+idyu4gLHDaMTIkUnRyX1Aaa/jVBlJlBcla3MeWzqTelT4Q0MkHwC+8mJI9DJ3DhNANnoBZIlbpzBJOFVL16MGP/HtW8GbOJ/Xw7EK15eTyg5Q/mtiHx/sll18czfjuMzmZ676gQFBkV02AKkSh/jT5aCySH0IByS4c5/t+Hyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkCBII+VppymZAtYCSdLPQHO6WMl8IAuIZ+94tklk2s=;
 b=gIM821JoCot7OUG/AKI0kdsp7EXjkAxWTQxFtAkaZiGRGKP0DuIsv/aEs+xzmZzjZvuwfD7oKTppoKn03j1DeEa5XQqXDBEh2gYEwotIqVbkx9iaiNerwWzwCHQYO2ouY4c3MvdJwctWvVs9nJkRajnXQlmzx078gunjqyMTJNE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4899.namprd12.prod.outlook.com (2603:10b6:208:1cf::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:40 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:40 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 20/44] drm/amdkfd: invalidate tables on page retry fault
Date: Mon, 22 Mar 2021 06:58:36 -0400
Message-Id: <20210322105900.14068-21-Felix.Kuehling@amd.com>
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
 Transport; Mon, 22 Mar 2021 11:07:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 43144203-82d1-47a4-38db-08d8ed22b58b
X-MS-TrafficTypeDiagnostic: BL0PR12MB4899:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4899EDF2319A492718BC1EF992659@BL0PR12MB4899.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hm9T8HJSNM36eRVeFdmWQVYVtusEIkD+x89tw1IVOmwmkDCBQgTBB+UW8lqmHVk6ffGZuUqnrcMxRmpXPZp3eRijVnC2Ww+kiFE9EzMCmWpmcjQj9V/aMDjUlGCsK7vg8gvN53QKZQmr0t4N62TTddLn482pVu6NCuUakc/kqACWzMATRS7tLRmhHJgbm3IdqjmtC09rV/QJ4FFlu81FvP5uNP8toZ0aRhFJ9QruGcBhvq/IBXJcy1B113/QRQvyDRJL7Zhxd3sHpjuV4pccOw4H79UKpcj7t+/NUyaS+FxTpZ37tP4bfAgESPiq8ncyphsHHTB2Ah1OwGq1jm+GXxl8PLFamFok2Ha01m0fYUSYKCsUGHh11qTXk5Ix6XG8GKHhCiMnsZCcSBfEfCvJkphKErwVbTQZ5vx8Q8cqBnB/DOQ+iBN4a94AqKVTYswwOxO3AXyFXyrwQ/0jphmy6/lwklMXpQMD8xVuoPSEYXYGN/eETacvkzuSa1JzYXKzQMKmqRdTIu+kRScfarS+igUMx1XteIpJjAPhE7itDMlQDWpata9KvAvN9jgQq+YbGG45WDGbGiN3rtAopAbR5jtJv4GukfFnZUBx8HOX/CW6AocQmI+xiDdKbx+ytBZ0QUD27QtKj7QKmFyor8mCcC+LbkjpFWwtLDWdKI7QVj0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(36756003)(83380400001)(66556008)(66476007)(186003)(66946007)(2616005)(8676002)(956004)(16526019)(86362001)(8936002)(26005)(478600001)(6486002)(5660300002)(4326008)(450100002)(316002)(2906002)(54906003)(7696005)(1076003)(52116002)(38100700001)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?PDDMKzCrLvdL0iIrHeWlRmcUj0C9lOP/vqYHyEcdVXUFZsAXm00ZJpBUajv7?=
 =?us-ascii?Q?S9kMmobJuG3LschyRByz92rvlkjXs+NO2yelk+pnepsNq/++hxC9BZExS3pT?=
 =?us-ascii?Q?3mqtT0SGubT5o9Cxv3lGsXS4hPe8P6fGdO25+ixaxFJ0r9sN6Q7Lw3sFGoJA?=
 =?us-ascii?Q?KvVeGlm1008pJA8DkDxP5D8jRpuBDXhT56uPEx81T8Ejh8TI2u0TXk9P2a64?=
 =?us-ascii?Q?z1q60B+YoGH2RSnnNOeBgb7BJQcSAbIM8cYdncOapHpuCUWL9KvsEuJ3t9Ly?=
 =?us-ascii?Q?HR5VLcvOELOupU7IsmmjfNGoylyq/MNgcC+u6cu0czyAWh4uGe4Oaq6H1lDb?=
 =?us-ascii?Q?My4q2PjK6qG71oDdWuipwb7zP24yvAYroAljwmsVj0BbfL0zk9Kmq+yiU10c?=
 =?us-ascii?Q?y7DLxvRsTcUWTMna2+WV/xR7kYWM7H8AsbkagI2PlWksORJIJFuQ4dfKRE8C?=
 =?us-ascii?Q?Pa0R64/a8g1mzpamV+I0IaxCDHh2sukTiXeMrtrBMk/6bD06YSy3aKcPt7XH?=
 =?us-ascii?Q?XggPEbaZjrez6Qsge1aL+eTCkxNBPtAw81T+ENgEZsCkrHm32ynaWzEz8hcE?=
 =?us-ascii?Q?Cqz5RAq3IZdMju7BV1W8/bFnNNIClKe8MUDLHu5SCe594Cdf8+BH0Y0um+aX?=
 =?us-ascii?Q?o3Z9SG1VCcCDqM1iLvyyfl2jyA8IEO44tqLRhcHgsdbakCSM4OoCGLk5v0hk?=
 =?us-ascii?Q?lWWrOXrLxb1Rak8oCItKrLJNjokO9v0hQh+LTyUCMp0Pouc9BuT8Cip63oKe?=
 =?us-ascii?Q?G0r4P+nEiJ8vbo1Ed0mvBs5YdDcfz/HWXB50KUENJkyaPmNMO8zzFYu6qwPD?=
 =?us-ascii?Q?26p5No7vfLvznXFhP7zu9k8a/jZtgFbabCVOj5HvHKbh/vtyz/U31ogzTcvD?=
 =?us-ascii?Q?VpI3rp+hbe47y+8+qPlJyCmLCTPofw6Xp7DVqiWpJghbi6OSPNgguiOfTzv+?=
 =?us-ascii?Q?0i0wHYDjNy8nDHVXZjY+5SYo10Vm0X/JlJyX/ZA5xL4bw5E7cMwA7Xo24CzQ?=
 =?us-ascii?Q?48/IcxPOu7js7KR5z+Hn8KG5v7JaocWeL8cOtOK/YKuTXkTVL79HED6T6q4a?=
 =?us-ascii?Q?w+2RltW2ybAouHR9MN8pwSaJbRHarh/isy3E7p3UDM7JlDiCbTuDSV3h9zLf?=
 =?us-ascii?Q?G5/7O585g/OB8WAO85kgsdRBzfqIE5+9IxaKJ+KHhrz35plUKHjQHugQm/It?=
 =?us-ascii?Q?0+a6hCREUaPQhNZ0GRsbg98093nLCWiqfwMLfQxsOBbM4483Aa38RGxyEODE?=
 =?us-ascii?Q?JgTFDwSXW4WyBrazRZqb4aCMuvIQ0jc2LlY7UD18JOEvzaSERdB1vjSRIGCs?=
 =?us-ascii?Q?IJhYmEOdmmVQawMnLvA27T9h?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43144203-82d1-47a4-38db-08d8ed22b58b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:40.5994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwuzD7vOaaCNxyKb1+bvheQoRQHig6EAArBFHbRpgJCuPFCMvoCL6uET4nLmng8QVimxQO9a2d5PHEyxj5lruw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4899
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
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 71 +++++++++++++++++++-----
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |  4 +-
 3 files changed, 64 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 1243cf02f872..8ce3ff56a0ce 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -789,7 +789,11 @@ static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
 	list_for_each_entry_safe(prange, next, &update_list, update_list) {
 		enum svm_work_list_ops op;
 
-		op = SVM_OP_UPDATE_RANGE_NOTIFIER;
+		/* xnack on, update mapping on GPUs with ACCESS_IN_PLACE */
+		if (p->xnack_enabled && prange == pmigrate)
+			op = SVM_OP_UPDATE_RANGE_NOTIFIER_AND_MAP;
+		else
+			op = SVM_OP_UPDATE_RANGE_NOTIFIER;
 
 		svm_range_add_list_work(&p->svms, prange, mm, op);
 		list_del_init(&prange->update_list);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 69241ed4a377..fb8ca844d9bd 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1006,6 +1006,13 @@ svm_range_split_by_granularity(struct kfd_process *p, struct mm_struct *mm,
 
 	*pmigrate = new;
 
+	/* xnack on, update mapping on GPUs with ACCESS_IN_PLACE */
+	if (p->xnack_enabled && (*pmigrate)->work_item.op == SVM_OP_ADD_RANGE) {
+		(*pmigrate)->work_item.op = SVM_OP_ADD_RANGE_AND_MAP;
+		pr_debug("change prange 0x%p [0x%lx 0x%lx] op %d\n",
+			 *pmigrate, (*pmigrate)->start, (*pmigrate)->last,
+			 SVM_OP_ADD_RANGE_AND_MAP);
+	}
 	return 0;
 }
 
@@ -1407,25 +1414,38 @@ svm_range_evict(struct svm_range *prange, struct mm_struct *mm,
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
+
+		invalid = atomic_inc_return(&prange->invalid);
+		evicted_ranges = atomic_inc_return(&svms->evicted_ranges);
+		if (evicted_ranges != 1)
+			return r;
 
-	pr_debug("schedule to restore svm %p ranges\n", svms);
-	schedule_delayed_work(&svms->restore_work,
-		msecs_to_jiffies(AMDGPU_SVM_RANGE_RESTORE_DELAY_MS));
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
+		pr_debug("invalidate unmap svms 0x%p [0x%lx 0x%lx] from GPUs\n",
+			 prange->svms, start, last);
+		svm_range_unmap_from_gpus(prange, start, last);
+	}
 
 	return r;
 }
@@ -1621,6 +1641,7 @@ static void
 svm_range_handle_list_op(struct svm_range_list *svms, struct svm_range *prange)
 {
 	struct mm_struct *mm = prange->work_item.mm;
+	int r;
 
 	switch (prange->work_item.op) {
 	case SVM_OP_NULL:
@@ -1639,12 +1660,32 @@ svm_range_handle_list_op(struct svm_range_list *svms, struct svm_range *prange)
 			 svms, prange, prange->start, prange->last);
 		svm_range_update_notifier_and_interval_tree(mm, prange);
 		break;
+	case SVM_OP_UPDATE_RANGE_NOTIFIER_AND_MAP:
+		pr_debug("update and map 0x%p prange 0x%p [0x%lx 0x%lx]\n",
+			 svms, prange, prange->start, prange->last);
+		svm_range_update_notifier_and_interval_tree(mm, prange);
+
+		r = svm_range_map_to_gpus(prange, true);
+		if (r)
+			pr_debug("failed %d map 0x%p [0x%lx 0x%lx]\n",
+				 r, svms, prange->start, prange->last);
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
+		r = svm_range_map_to_gpus(prange, true);
+		if (r)
+			pr_debug("failed %d map 0x%p [0x%lx 0x%lx]\n",
+				 r, svms, prange->start, prange->last);
+		break;
 	default:
 		WARN_ONCE(1, "Unknown prange 0x%p work op %d\n", prange,
 			 prange->work_item.op);
@@ -2235,7 +2276,7 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 		if (r)
 			goto out_unlock_range;
 
-		if (migrated) {
+		if (migrated && !p->xnack_enabled) {
 			pr_debug("restore_work will update mappings of GPUs\n");
 			mutex_unlock(&prange->migrate_mutex);
 			continue;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index e6b737889bb3..3f945a601546 100644
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
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
