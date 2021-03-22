Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB81343F3A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0356E41D;
	Mon, 22 Mar 2021 11:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF506E3FC;
 Mon, 22 Mar 2021 11:08:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AzavCaa7lVsFPeJv4NhQN+vBbUHV9hnTUe1OLq2VrCK99rZkXEg97Jf+IPcirR9ZhVZlTr5pcRsVKaN5tnMnksHPGwcOZkehJSMv/2mS9YDjYEyxCRUPcVtO/ixqa+KrSrTCoudLNJN5JyQaXn5AhY0ebEZcZleMTBmpb/t2aJMjZl5j+Uf60f7+XbDUSAcJVUSce13mkilgZSpS1bdZeNeybVIfxv7ywd59hN75DJEqTbeAGFYVdrKwe0HpgTD3WJonRxdl7ZfigrYgva0fQcCSBNDXLHTbLgHdB9S7EcjYlcVqwGaUQojsG8Oc31BGd1PZnXv1tH2NESVIc4ht3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZCt1lqVtIYxz+pdsCdtNIA6HPeG7QA6q+VZqw/gBFc=;
 b=jY9f4VQ6po48Zp8PPH8b2fO6gnGajiGHINzAIjC3neUOMwHdqNWDtlWIF/c//gCCgE7H3S95sH2QIw6zFrEvCTj9qJUHxa0YH9t0KLCdqEYrhJYU4gVF40TFHNUdGo4B3+eEPsDnNh1EWjmLhWchLtJyVVhUxT1H3C40a21ZtVlA5V5V6opqHyOHO9+XFmZFKH7dYaQ6LlC0WxLXE+xC94Vdg/+6EPEPNe3YUgJaHCSqWNh0qNz5/8+y0BEGmUNucFOc1Eq3c1NPphmWdaGhIejvrMcxP49z+ruh2u0+xKMd93OrniU6WXVPD6/F2eHWgvpzFrBMvLncTBdmzaGV+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZCt1lqVtIYxz+pdsCdtNIA6HPeG7QA6q+VZqw/gBFc=;
 b=cgxrZxtBNALkOsUtp4kP9/8RnjuPtK6+n31QeSiLtQkH1p1uIcHMcwKaTsSZAYvSfz7X5lhlZu1uaq38/gF9tf7SeB+J4H9BzlWhzmICJVzkBM3vZXX2GtP/3JvoPhHxG0vaF1pG1yX+H690mqGghpAaFwiYOlrldbl04+H11HQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Mon, 22 Mar
 2021 11:08:20 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:08:20 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 38/44] drm/amdkfd: Simplify split_by_granularity
Date: Mon, 22 Mar 2021 06:58:54 -0400
Message-Id: <20210322105900.14068-39-Felix.Kuehling@amd.com>
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
 Transport; Mon, 22 Mar 2021 11:07:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d5fd3120-15f2-475f-86ff-08d8ed22bb0b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4255:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4255FD382F5B104F399E1D9792659@MN2PR12MB4255.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:660;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tpHmFvlIMmfw7B6TAJdEj/ijK290viHNEk28YmrTHHQt0/FvgG8WfSgs1m78pKFp5924z7VI94ifba1p0zVW0VKvPl7VJyjBl1i715y2h7azsNoamhrbkODIvEhql0QKNHCeOTwSfHv3E5dcs/QIOl8Utz1xGh9Fwut/FGcDHcV4bF/zJJfaXNt2BpxRojN0nzK6MPQhiJtVtOu1HJyoEXKZzFEKJdZo3x2pGBwhUkDoHFdfdyVcjniPF7IuGYwsbIxtLUXKDzbXcOfBk/E2l2Va3poyF94J+IUs1SUfwX7+/3hF34UgBIjjUqdDnydKD7h67QNdcE+Wd4lEsaZsWe1C5aO09CHquhV1OFawJG2wIaJyyVeWTCHz2BSf8MVTxxwz9kCK70ngatTSe1qifkxORmulLUfH/fJYa8mXitLSz/GAvhan6E0sF1T8lGK+JPhX9KiIovCiCBMJYOuvtJMyXpBbisHWlK42OZPGfaBAxplzXBwEB1hHDbdTHFkZRw2kNsEJdY/ODrrF60nu7iE3vVOfxLmDOT4mGshwkLi4KTw4FQcvxIiAEIX4R4evl5cQXMpZQ3vvLgXmzKL2IgP2GF0FE7mxfA5qbEifKtnZNkFGq7lOuMq0rMPJ5GxA8NtrI/PKZlfv3deSSyK9MDpGqrbeFb7Sd7/1yK0FWWs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(450100002)(1076003)(36756003)(38100700001)(6666004)(66946007)(83380400001)(66556008)(66476007)(5660300002)(16526019)(186003)(8676002)(26005)(7696005)(52116002)(86362001)(478600001)(8936002)(2616005)(956004)(6486002)(2906002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3ruPRgm2t+2trutAnowqxUk9TfNhv1cVDk7KCWrXQivENxAkQuzxQgv+CZ0F?=
 =?us-ascii?Q?RN9oADCmsY2ewgfqsV2XVI+IowIx/QDn0YTepkbRihXk7z5xLIh+eEjkDG2v?=
 =?us-ascii?Q?6bngVE/cBIaDJad2UwkCPgFXISbr9NiJbohvW9E8dROi5Gb0s0C2CXzpWwFU?=
 =?us-ascii?Q?NI7uLZWIg0LSTw2GI1mhs3jC+Wc7qCirAz/6jGNKuQ8hQea5jAUXGIjOzxdf?=
 =?us-ascii?Q?ro6VWUbUxqwTtdD99jh3BqoClhlRm75ompIg0SUauuFC4GGXMx5xoIRyV647?=
 =?us-ascii?Q?M+EV9lLdzEysMcUVazHuAvYVRdk8rjXIdxgPR8yLQ/xyojuf6YwIWkWUZRUq?=
 =?us-ascii?Q?v447Q48PejvUy03QGlRiG8UDxA2G0kp002Qx4XuT8b72IHEDYq10TBqlFcfM?=
 =?us-ascii?Q?QkpGl0P23Cd6oZ4Wn+X/opK9Cm0N754ILq0rgY0dU/rfiaziE9EEvLEa2Lwo?=
 =?us-ascii?Q?v7PVhdVtbg59svEoYNYhlkl5aPYqDhbKEtPNVkTDiLx80YDmsyq/bjv6vAf3?=
 =?us-ascii?Q?eYdMSCo6dCmN8rxGkMW3sNjE2Ol/nRKyJ6QQJfAR2BoMUmF/1n6RNpsT/bL0?=
 =?us-ascii?Q?AF7eLEzxdeXheLJXnF6qI8RrUTY3qEkuxjtygBYQVBnxks4azeByoU18mYR8?=
 =?us-ascii?Q?74sSS8lAkVYdTo+4ZZZXPeRnClR3dEiW3s80OveNFq+5VIKFI0i9cp7rXC9m?=
 =?us-ascii?Q?Sak1tWjY2wdmDE8ZjS3wS/DCztMSycfbDqG2XnqXiJ4NZqFSBJJ5cnUDsAlH?=
 =?us-ascii?Q?taeW9JYcn83QwW7ak3wDbnqp3vEVAy/9OAf2Qkr1c9w7wHPvf5Sa4LO9OtN/?=
 =?us-ascii?Q?yMuonwDmOJL6sgoWzXv8oUzKg1GMVwrWp1S40LD+R1MsX3Gw+33OJQknDas2?=
 =?us-ascii?Q?NyBAxCCK9teNxePvcQpWVDm+HaemR8dmNuwT5aIcJ1TKQbz80AmIzzLcm4hY?=
 =?us-ascii?Q?0DT6k034ZgbxI/HrWm/tpGTusagMaWfzvbbZ7Yi1QX27VtKNH/8hNu64sjqU?=
 =?us-ascii?Q?POS6+zHtXXdd8a+RCxGpES6jvMOXIVtYexvwTsgMkiceYTxIsXc9UW6jndha?=
 =?us-ascii?Q?DMy5aAZlI5ZjZsUqv1WAkzCAeaByvp1Cmc2u3DOHwE9RGedj7PtrC8dG1fJq?=
 =?us-ascii?Q?O88VnGFl73IZT6JhOMMsOOozF8NOf94fqO9/2nYPeBHRlodBt5qDCDqa6Kh+?=
 =?us-ascii?Q?rlk2s3SBmNPyj+KGZS16y8V6+qAay3kui4FkNF0H0lw/14KYYw2OKUo9d4Tg?=
 =?us-ascii?Q?B6U5TlGGK6ta4Do/LyHHXLyKdO7F90tnDyKuHLKjwV2T8w7QGqOMQNvu+vnU?=
 =?us-ascii?Q?/OSMJmjmCjA6wPM3ihqfrIyX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5fd3120-15f2-475f-86ff-08d8ed22bb0b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:49.7094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gVcwO2ZilYPjbR4ZJiD4xGWEOCGDv1uEDJDO8JVSRFOsIjFnP2jOp4rmPyrkF6mzZfW7IUK8xudAx565Hu+Kpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

svm_range_split_by_granularity always added the parent range and only
the parent range to the update list for the caller to add it to the
deferred work list. So just do that in the caller unconditionally and
eliminate the update_list parameter.

Split the range so that the original prange is always the one that
will be migrated. That way we can eliminate the pmigrate parameter
and simplify the code further.

Update the outdated documentation.

Change-Id: Ifdc8d29b2abda67478e0d41daf5b46b861802ae7
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 29 ++++------
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 73 ++++++------------------
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |  4 +-
 3 files changed, 30 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index da2ff655812e..5c8b32873086 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -780,12 +780,10 @@ svm_migrate_to_vram(struct svm_range *prange, uint32_t best_loc,
 static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
 {
 	unsigned long addr = vmf->address;
-	struct list_head update_list;
-	struct svm_range *pmigrate;
 	struct vm_area_struct *vma;
+	enum svm_work_list_ops op;
 	struct svm_range *parent;
 	struct svm_range *prange;
-	struct svm_range *next;
 	struct kfd_process *p;
 	struct mm_struct *mm;
 	int r = 0;
@@ -816,31 +814,24 @@ static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
 		goto out_unlock_prange;
 
 	svm_range_lock(parent);
-	r = svm_range_split_by_granularity(p, mm, addr, parent, prange,
-					   &pmigrate, &update_list);
+	r = svm_range_split_by_granularity(p, mm, addr, parent, prange);
 	svm_range_unlock(parent);
 	if (r) {
 		pr_debug("failed %d to split range by granularity\n", r);
 		goto out_unlock_prange;
 	}
 
-	r = svm_migrate_vram_to_ram(pmigrate, mm);
+	r = svm_migrate_vram_to_ram(prange, mm);
 	if (r)
 		pr_debug("failed %d migrate 0x%p [0x%lx 0x%lx] to ram\n", r,
-			 pmigrate, pmigrate->start, pmigrate->last);
-
-	list_for_each_entry_safe(prange, next, &update_list, update_list) {
-		enum svm_work_list_ops op;
-
-		/* xnack on, update mapping on GPUs with ACCESS_IN_PLACE */
-		if (p->xnack_enabled && prange == pmigrate)
-			op = SVM_OP_UPDATE_RANGE_NOTIFIER_AND_MAP;
-		else
-			op = SVM_OP_UPDATE_RANGE_NOTIFIER;
+			 prange, prange->start, prange->last);
 
-		svm_range_add_list_work(&p->svms, prange, mm, op);
-		list_del_init(&prange->update_list);
-	}
+	/* xnack on, update mapping on GPUs with ACCESS_IN_PLACE */
+	if (p->xnack_enabled && parent == prange)
+		op = SVM_OP_UPDATE_RANGE_NOTIFIER_AND_MAP;
+	else
+		op = SVM_OP_UPDATE_RANGE_NOTIFIER;
+	svm_range_add_list_work(&p->svms, parent, mm, op);
 	schedule_deferred_list_work(&p->svms);
 
 out_unlock_prange:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 3a7030d9f331..fbcb1491e987 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1005,16 +1005,14 @@ void svm_range_add_child(struct svm_range *prange, struct mm_struct *mm,
  *
  * @p: the process with svms list
  * @mm: mm structure
+ * @addr: the vm fault address in pages, to split the prange
  * @parent: parent range if prange is from child list
  * @prange: prange to split
- * @addr: the vm fault address in pages, to split the prange
- * @pmigrate: output, the range to be migrated to ram
- * @update_list: output, the ranges to update notifier
  *
- * Collects small ranges that make up one migration granule and splits the first
- * and the last range at the granularity boundary
+ * Trims @prange to be a single aligned block of prange->granularity if
+ * possible. The head and tail are added to the child_list in @parent.
  *
- * Context: caller hold svms lock
+ * Context: caller must hold mmap_read_lock and prange->lock
  *
  * Return:
  * 0 - OK, otherwise error code
@@ -1022,75 +1020,42 @@ void svm_range_add_child(struct svm_range *prange, struct mm_struct *mm,
 int
 svm_range_split_by_granularity(struct kfd_process *p, struct mm_struct *mm,
 			       unsigned long addr, struct svm_range *parent,
-			       struct svm_range *prange,
-			       struct svm_range **pmigrate,
-			       struct list_head *update_list)
+			       struct svm_range *prange)
 {
-	struct svm_range *tail;
-	struct svm_range *new;
-	unsigned long start;
-	unsigned long last;
-	unsigned long size;
-	int r = 0;
+	struct svm_range *head, *tail;
+	unsigned long start, last, size;
+	int r;
 
 	/* Align splited range start and size to granularity size, then a single
 	 * PTE will be used for whole range, this reduces the number of PTE
 	 * updated and the L1 TLB space used for translation.
 	 */
-	size = 1ULL << prange->granularity;
+	size = 1UL << prange->granularity;
 	start = ALIGN_DOWN(addr, size);
 	last = ALIGN(addr + 1, size) - 1;
-	INIT_LIST_HEAD(update_list);
-	INIT_LIST_HEAD(&parent->update_list);
 
 	pr_debug("svms 0x%p split [0x%lx 0x%lx] to [0x%lx 0x%lx] size 0x%lx\n",
 		 prange->svms, prange->start, prange->last, start, last, size);
 
 	if (start > prange->start) {
-		r = svm_range_split(prange, prange->start, start - 1, &new);
+		r = svm_range_split(prange, start, prange->last, &head);
 		if (r)
 			return r;
-
-		svm_range_add_child(parent, mm, new, SVM_OP_ADD_RANGE);
-
-		if (parent == prange) {
-			pr_debug("add to update list prange 0x%p [0x%lx 0x%lx]\n",
-				 parent, parent->start, parent->last);
-			list_add(&parent->update_list, update_list);
-		}
-	} else {
-		new = prange;
-	}
-
-	if (last >= new->last) {
-		pr_debug("entire prange 0x%p [0x%lx 0x%lx] on prange %s list\n",
-			 new, new->start, new->last,
-			 (parent == prange) ? "" : "child");
-		goto out_update;
+		svm_range_add_child(parent, mm, head, SVM_OP_ADD_RANGE);
 	}
 
-	pr_debug("split remaining last 0x%lx [0x%lx 0x%lx] from prange %s\n",
-		last, new->start, new->last, (parent == new) ? "" : "child");
-	r = svm_range_split(new, new->start, last, &tail);
-	if (r)
-		return r;
-	svm_range_add_child(parent, mm, tail, SVM_OP_ADD_RANGE);
-
-out_update:
-	/* If parent is not on update list, add it to put into deferred work */
-	if (list_empty(&parent->update_list)) {
-		pr_debug("add to update list parange 0x%p [0x%lx 0x%lx]\n",
-			 prange, parent->start, parent->last);
-		list_add(&parent->update_list, update_list);
+	if (last < prange->last) {
+		r = svm_range_split(prange, prange->start, last, &tail);
+		if (r)
+			return r;
+		svm_range_add_child(parent, mm, tail, SVM_OP_ADD_RANGE);
 	}
 
-	*pmigrate = new;
-
 	/* xnack on, update mapping on GPUs with ACCESS_IN_PLACE */
-	if (p->xnack_enabled && (*pmigrate)->work_item.op == SVM_OP_ADD_RANGE) {
-		(*pmigrate)->work_item.op = SVM_OP_ADD_RANGE_AND_MAP;
+	if (p->xnack_enabled && prange->work_item.op == SVM_OP_ADD_RANGE) {
+		prange->work_item.op = SVM_OP_ADD_RANGE_AND_MAP;
 		pr_debug("change prange 0x%p [0x%lx 0x%lx] op %d\n",
-			 *pmigrate, (*pmigrate)->start, (*pmigrate)->last,
+			 prange, prange->start, prange->last,
 			 SVM_OP_ADD_RANGE_AND_MAP);
 	}
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index b2ab920ab884..7fce3fccfe58 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -162,9 +162,7 @@ int svm_range_vram_node_new(struct amdgpu_device *adev,
 void svm_range_vram_node_free(struct svm_range *prange);
 int svm_range_split_by_granularity(struct kfd_process *p, struct mm_struct *mm,
 			       unsigned long addr, struct svm_range *parent,
-			       struct svm_range *prange,
-			       struct svm_range **pmigrate,
-			       struct list_head *deferred_update_list);
+			       struct svm_range *prange);
 int svm_range_restore_pages(struct amdgpu_device *adev,
 			    unsigned int pasid, uint64_t addr);
 int svm_range_schedule_evict_svm_bo(struct amdgpu_amdkfd_fence *fence);
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
