Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BF8354A77
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226116E528;
	Tue,  6 Apr 2021 01:47:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5FE6E245;
 Tue,  6 Apr 2021 01:47:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V41yT0Apu6SyheM1ZNfFRfdEN+TJ57bcdNUDrzoJ3Vkk9x8LKXaNPZ4BypDXLedC7PHhzbjiY4ZvWbXI/3A6in8wSOA3cRjxArlC03jmxVKoxbMbjZcpsKbWn7Gvyj0SfKKIP12+WKis7C1MGLiQ69OICM+lQIhIcSv8SHtpZtFSHl3eOdHiXVmw/zaOj+f8WUh1+xm8bx+5mP91O0z2PvMyXj4ONtTzt3qZaJJfi453tJTJgYWrbKQSvS2/RS8EwhulUBWWjKu4dS2wj0qjz4CFIfWyWdPIu3IL661XfOwL8/s0UYLiam635W5WrgL3Ikk4U0+qRfEGnCWlzr6E/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mQ1YpE/FQgvk6ZhnbNXKRvmMGkyoJX++d+iXLfINOU=;
 b=Lu44V//RVQ6saJiIbd0SprrVo1WSEmXvnxVNv3q3KzJ6I3RduVWBROnraRODySCc+euqR7BOl4FPERX8AQ7y/TN5Y0SLDrszeuSOfc0MINzsQF2TA193AITeO6XMEfsiMIC4Ox9QvAOs9jysb9YLmgri0JlxElK2ANZvFlFjOY0sBgbhNWms+NWj826wjA7W0cnn1yjD/T/QrZ39DyL5QiVfTMjpj8FDr5uAG6hgZZyKQPnnq7750CfXHjyAk+m31PEINRNMel6z7ZjOds3HjnrU52lUuwcDXY0MocBaoLEz2+7lQEQOIwVrHw9e6oSoBSMpXpOo0kjYwAPxdMLw1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mQ1YpE/FQgvk6ZhnbNXKRvmMGkyoJX++d+iXLfINOU=;
 b=IpkWDIPL63vqEbJGMwxoFPla8BSgXK1IBHxY4EkwJKME4QmsctlTvV/WmhAJgLB0JDKt5eStUzOHiqIWzYGs51VeoFbVrVj121QCB8l7/lSX2cibgf7y0waxwYRHkfIWdVREgcoXclJgthYS5qiG9ytbcbx/R8iNwW8texC2Zvg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3792.namprd12.prod.outlook.com (2603:10b6:208:16e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 01:47:05 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:47:05 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 21/34] drm/amdkfd: invalidate tables on page retry fault
Date: Mon,  5 Apr 2021 21:46:16 -0400
Message-Id: <20210406014629.25141-22-Felix.Kuehling@amd.com>
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
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:47:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b439d41-d14f-473d-53e7-08d8f89de1b0
X-MS-TrafficTypeDiagnostic: MN2PR12MB3792:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB37921A202BDF685D59D79FD992769@MN2PR12MB3792.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: asqhEtJDC9m2MuDpVcCmR5GzNZ3eexvCpFq1SpWLYrE8g1Xwj0bLnShCXb/2GiAQpiZVJqg04/z/cltEETc+BrEpnJMrNrDqAtM47gqSg7whFJJs7T5so6ZDczAvQv5OiYdRhlgtC+SfEHNgR9e1rfQbpGXFLYzmJTuCLTcv50RBrzLPvEhC8/I4qPZw1dV0DXhMijCQtNJV5cJ3JnmctmpTTR576I5vU17fM/346J4jc1+KOuOfvo4gxktTHaCXbY4JjSGOtrT/35j1dwHGKEkl+LOislJdUnfc0RukzR40cRFnC3oG0s2m5loTW822+qATptNO3aE64uv0OaD/p+o6G69tpvjorFXO+7qQvW6fIzkQvxOenXyacPn+HH1lWMqgBCR5ZkFQXTIbKy6jWftEHdPnyzl3cDST+NzapIcRud27NSihyg0lOlawvgRyyqoq6xARMdPvJD5UutpYYSK1RTB42zNv3pwJWSQX/65YCcJUbwO+SE4NpnkQXoTTO9ecGHsk+nZ8Jkzaid+DYY79i/40FNE9sFAN/C/tIjSQ/GCIC0PdJe/x6dmz8UPeUbkP/PFyF58qe5CKXCdjzZGLGM1tgpyBabncoct1f4EW4KJADwmDRWaiuLtCceyhhsVjbK90o+q4HshbcJQL1qZbOBtAB7frN36byXDszPrRlkMJnuklJgqsnCKVZQDu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(6486002)(316002)(66476007)(26005)(8676002)(16526019)(83380400001)(186003)(1076003)(4326008)(8936002)(38100700001)(2906002)(450100002)(956004)(2616005)(36756003)(6666004)(478600001)(7696005)(52116002)(66946007)(86362001)(54906003)(66556008)(38350700001)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?VpHMeQnknOO+C/ULk9xcohIpEw3X4fD0rG/6WExPjN13mvIZ5+NxtjIdPiAb?=
 =?us-ascii?Q?tSzrJlEGtgOgCAw0La2D8u1b7KiFbjlVvuP19IDSscDscG2JAxxyixK10uCF?=
 =?us-ascii?Q?yOzC7urr7y2iJ4QB40nnsUJfD58qHQ11bHX6xqhUSIs/kXpe4Cob0dFgP9Vj?=
 =?us-ascii?Q?iin5ENbN7/aVogFxEMFiB6HyFnhGaw3Ehz71CHKUqfF2FI2rKoLG9ASmBb34?=
 =?us-ascii?Q?TkHEngcRMqJ7n9EZ0OCDOtqLid/sa7RGp9B7RemqceBh+8rZy1eSzKKC1NJx?=
 =?us-ascii?Q?CXLJMQUvmtqQXDMT/a5LppgEmBNRCDNwb4XDKaqjo1nPo0IXM+2EKbNeMEh3?=
 =?us-ascii?Q?bjsWXkGdIItD5eorzzOTxsZtlV18C1ehtPSHUW282QPoYgVo/TxX3U5XM4N2?=
 =?us-ascii?Q?iCokML9pBzyuqwJxwugisopmqqS3mn8zU4Y7oAddLkusYP8KoxpxV9Kf3QZq?=
 =?us-ascii?Q?howjB/Y0rJRRuxnEqH88BJKzarNTMzXktZrFIYLhgCeHUsN9eqJpwvqaAzBu?=
 =?us-ascii?Q?OQP3WZ4iHugKnSP9Fe4QmsP7g0F3q0D6xa6wHXDDaE5yafqmQKA375BxJbWD?=
 =?us-ascii?Q?ryz/5XpfuNCPKlvwTxSvXzUeR1pqA6qNqfMUReWdP17nfmFovX+45j13cfQY?=
 =?us-ascii?Q?S7ZaeZJ5E8nWvyZhtBO81vrqX7/gSJWkPAJ0yWQe57njRbgRPqJlsDbox79u?=
 =?us-ascii?Q?yxTsHJXPZ7hSeehDzPGTiNLse7D14sLV2fZbw796Tt47AMgEa9kIbklg50Fu?=
 =?us-ascii?Q?qcT3KUQLx9iJDj/CQFN3H88elxMtsr+S18kLi023rGUhV8M+wWWadUrA+zue?=
 =?us-ascii?Q?YXd8kSSdiovHSfg+ehq5J5PnWWl9mJ3QMhbXhLGHuZYslZlT6RIA9U/iiHlx?=
 =?us-ascii?Q?2KDhErfsylUKUKJ6rcC8C5zc5a3kYwD/T6l8J65q8y0uEQWRVtTu5qr/GE7L?=
 =?us-ascii?Q?8cMYFUhagYcpbBYhHQrAH0N/soTSTkPRmSPmBX7rxVypZ/TwOnV4DQL0eS7d?=
 =?us-ascii?Q?mbwJFTp63qbLb4tIktxoyEuen1bT4QRQrbBZvg7M7hG3PfoobkgNMfw/SRNa?=
 =?us-ascii?Q?BE9dw0po5eqCbMX2lMCncFjF+ucqV0NgLGBjFuRwId0lBX8VhnmfEN1KyVuM?=
 =?us-ascii?Q?7LP82TriHLI61yGXCSvhAgO9jWi8IG8cOR30dc8BK2RShEGywmU682NCLfsX?=
 =?us-ascii?Q?cB11CRYMOwl+TJVxYfbTKLC9Vii6dtN7anFZ5s15ndMKz6GoOlTdQRKtGySv?=
 =?us-ascii?Q?RdtrfWHpt65M6rZIC8ANcEUb7e4poxCfdMK9CB7LYZ8ZU1Q1ReNHsO8KXJLF?=
 =?us-ascii?Q?XC7bWxS7uVDlOSvU7Tll+m2n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b439d41-d14f-473d-53e7-08d8f89de1b0
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:47:05.4790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yuf1lyKFs1llcVqxuilh36cNjELVXj0LBpccr6jHxQ8m2ZKKtqpDtS7QWJ7NrrKiy7g/FxB9XZxrD7bcRDEaSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3792
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
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 77 +++++++++++++++++++-----
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |  4 +-
 3 files changed, 70 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index dbec22c37151..6d22ca0819ee 100644
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
index 3d497bdd9455..398c9ef7464e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -913,6 +913,13 @@ svm_range_split_by_granularity(struct kfd_process *p, struct mm_struct *mm,
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
 
@@ -1456,25 +1463,52 @@ svm_range_evict(struct svm_range *prange, struct mm_struct *mm,
 		unsigned long start, unsigned long last)
 {
 	struct svm_range_list *svms = prange->svms;
-	int evicted_ranges;
+	struct kfd_process *p;
 	int r = 0;
 
-	atomic_inc(&prange->invalid);
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
+		int evicted_ranges;
 
-	pr_debug("schedule to restore svm %p ranges\n", svms);
-	schedule_delayed_work(&svms->restore_work,
-		msecs_to_jiffies(AMDGPU_SVM_RANGE_RESTORE_DELAY_MS));
+		atomic_inc(&prange->invalid);
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
+	}
 
 	return r;
 }
@@ -1677,12 +1711,25 @@ svm_range_handle_list_op(struct svm_range_list *svms, struct svm_range *prange)
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
@@ -2305,7 +2352,7 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
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
