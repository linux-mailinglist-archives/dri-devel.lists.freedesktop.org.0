Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE3E350DA6
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2945C6EC2E;
	Thu,  1 Apr 2021 04:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5783C6EC1E;
 Thu,  1 Apr 2021 04:22:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vo4t+/FKde+nR/uPLQegKJodBNr1TldHZdxtC/YFcdPGe6/QVAytaH6beBRz6rchN29cOObMfcS24L9bPg+wQwQP7WxJnUBNKbt1O7TYAUWuNifiUGEklxpvHbbWBo4A5oUcLZKlK7WPHLNcrhM4XjXv2hzc5bV1Bl6W79TBnbT0JDKxEecZtH6OnW8IE/WM/VNh1t1tDILhx/DE9RNsq7DGC+BvI/IMW8G7G0nR4Twq1/IIatgWTCqJpgmATs+05YJGKBSeMml+er8HNL4vDOqWu5bHpDAannafEmzDlzFqEUc2WLw4LfEsOUGvCYW7q+dKPhYXEDzsfexRv5Wh4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gd4w7Y5Ye8JYwZNKLnQ/ZzsIjamBbO7eszb8A2pn+KA=;
 b=Jx4gYDPgYd2z90TQhe+5AT8Qkdm3oybUxfNBftcygWVrrL1gvlgNS7ZXQdNU7XsjYraatpl5kouxS470E99CNJsuxHKPH9Bk5AEY3ic4cRQyQRl9UqiBwABoaOpv0xs8sbfW903VFgH4IKaAYQk4eD+tRsfTbg72et8e0PhgwKLmHqOgubvL5TgvN6R5qXmz+/EpSDQUwJyShI/HacOGCsLNFchDKk1xU+s5bgAPLIF16UfCp73yXQfNQdbagRr8Itt5cHF7nPYwIlANY40vls6kfx0Mmq7pIyDdb42YermUoj9pFY/1bnAY+PJISWehF74lzKqOqnNs/KK98zxP4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gd4w7Y5Ye8JYwZNKLnQ/ZzsIjamBbO7eszb8A2pn+KA=;
 b=5hPOwMDyBtmcolB4rbTHeavjdClaekoz04pmF2qgW5vdEBOszthHFRo22h2OBW+auQsvuW51vwvlexSncHQRj7TTAH9IqSGUynexIBPQIMSTDlrZwXBNXPdqx27Vn+2B+IjCO+oxQmMfcs8pmNQUQjfJZEqluKPq5IvWoExOr+U=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4916.namprd12.prod.outlook.com (2603:10b6:208:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Thu, 1 Apr
 2021 04:22:49 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:22:49 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 07/34] drm/amdkfd: deregister svm range
Date: Thu,  1 Apr 2021 00:22:01 -0400
Message-Id: <20210401042228.1423-8-Felix.Kuehling@amd.com>
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
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:22:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9868f8c-7cc3-40af-b074-08d8f4c5cedf
X-MS-TrafficTypeDiagnostic: BL0PR12MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4916EE295C15FBDEF07A45A4927B9@BL0PR12MB4916.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fCDbV3p8iq5LKVHbjCgqAxEj09KofEUoYsYo3qogw6DfB2kxmkonWfTE8KOJtc0gBOdllrcfSh9ZRiYl8hSQxYNWAJ6Jt+YpMosPE97/s5NoFYPKCeN+fBTqTCluAiCasdOTf7kwjvHpFva2Kfs2xgwSVtb/HWSWnEktFABo58DysqESGezvGqB7qVomM1FmibqzCjUq7IZug+PJRBOw9DZaRG0kNmkIaSOGrejpNVA2jp8YBeTv5TAn87eu4jlxIoB9ZMRdBFEfgdLyStue//V6p2NNAgsQS9Wqw8LgyWRULsNFwYHi88SC//jp4fMl+qHXdMb/dQCdQ1qMX8SwEnGqiFx0TZUmLv+aguTYpvpzFxaZ00bqLOFOO6/lIi7jYVCQaL6AQVG7Mw/wOourf9BWkIBWjVWLlE5t0I1ZkvcoF2NPngmSbnvts2NiqQfxgmP0xSI8y1wRE8Gpj+nlYK3rC6YTnmOgE0s3xvJjZLdbLFEfgBS/PQWcqiYzNZ4ft4O8sMkROKMbgYZjzzhx4EsE2qAcxyvv2tXrRnh5B/QNFuLCnDSTLBJlAVR4fVgtGtWa7u5FUJe8IBlpci+9EobuXGj00W8xTYlwT/vkl8insVYfEjwPFdftFbTptvffLpKDXJUMSjkd27tn7Hg16bYHlZojYjpIvpyTGMycEEQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(5660300002)(478600001)(36756003)(16526019)(186003)(1076003)(316002)(6486002)(66946007)(54906003)(956004)(66556008)(26005)(30864003)(83380400001)(8676002)(8936002)(450100002)(38100700001)(4326008)(52116002)(7696005)(2616005)(2906002)(66476007)(6666004)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?R70g9cI1VkRuOr0O1gZiGuJ9L7MMOclbp9en/VmLUiTeRBDew9a9I1SpLB9U?=
 =?us-ascii?Q?sYWbmdW3WWkPKfLs53zgdI9Ud1zRAVhNsVb7Z2CCr+t8W1m6/70GplJS+8US?=
 =?us-ascii?Q?lAs+qKYdZ776Og54weFwdkOqA9Xzxse/C7Ou4KisphBAzTGKd9uy0RRF8AN5?=
 =?us-ascii?Q?8jfXkls4r1hr4o2eAKDqfvvyB9f7sRCmAww43CUdV3g124o3IqsvBxJxYT9B?=
 =?us-ascii?Q?mnxW0PS4jgkCQbjMECKffCcM9TrqM4ppVlvQxMzoR6IL/yxQiriUO2atEdQP?=
 =?us-ascii?Q?g3HrUFdLNedVYZgVmvFtury+A1XxKOJs8YRrmdpB+YZdwzM+FkRGZf22V2+D?=
 =?us-ascii?Q?wYgmQpFO6QfS8E01R27yzsTf/3gndjLH2gMjAhGTaMqpxY1G84biOnRI3DMx?=
 =?us-ascii?Q?A/Yl+eXV68z/lh5EZgLqUQO/QXinhb63NhT5meVchAUg6kjon3nWX2wM6w7M?=
 =?us-ascii?Q?ivYw6gBlEZDsqBP+FDXFRdy5H2eXxSI/U/lkZjRsnQ+cmeuizYS9UDEfd+S8?=
 =?us-ascii?Q?YCPz5BR19Tx8NOKs5T3TrNHapGQzEQiApuZ6d5NYRZzJVncEd6KHPAS5QkN/?=
 =?us-ascii?Q?wepRGaLRJlpqQT74VIHCuwHdRjtihmiPrSdFqwo+SKWEEojpAEYEGysV5OVa?=
 =?us-ascii?Q?lUp3DnVTI8yawGcesbfRbXPeEEOVJj3I6dHG+eUFDDqaiBJXmCYv4ofPIHIu?=
 =?us-ascii?Q?3bjNHKKKZd7UtqnoWrwZXW8OocXHF69toOgFQQ2GB3KJ8jc40/Gxf/dTreZt?=
 =?us-ascii?Q?kvOMp2Dr1oavZ8OVkrEoXZeXBJg3GVof2z+phG+x2CUNESZP9T5egu7VqE0G?=
 =?us-ascii?Q?dVkvbP8KkqH7oye20kKfsiSNUcEy+rdLm33OFChPsRLBoERgcqKDCcRdeWhu?=
 =?us-ascii?Q?q2GaCBVWYS5ASGd49s+rjAEWNTb0OYb+/TRxqKZ6RAvwNCOFZaZn4J04q/aB?=
 =?us-ascii?Q?/wLs8dRPij7KGzNuPzoUwvcBZU9d7krxaJs9DBn0opwNYCItI/kbA9gqnCVq?=
 =?us-ascii?Q?KQh2hr8r7hyFIsWofsIX8b0UREomOBAO92KdjNeCj6s1tFtc4BgjmZNvQfR6?=
 =?us-ascii?Q?7Lown2hL/2d8JKEoT3hlEJcWN3brsJs9rh4/btLMIxhUarKjCaUAFlmhRGgX?=
 =?us-ascii?Q?aAPrX8C1ALkXSNegI/Tkk0/w+549Wgk90a7G2gm9tmVWVPYntJCaJlFrE3I+?=
 =?us-ascii?Q?pqOboYAohKn560Vp8lcTgGamzgG3eqPMge1MWiguyiWKPzRE7K7MpfWxHaAx?=
 =?us-ascii?Q?rg47RNml8+e6gTrsD59caxgBq6hZFFA3qZ1qUeAlowTdbqG3AVK20jhnBxq8?=
 =?us-ascii?Q?uDPYfoSpNs0yM51oKdwyjrKI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9868f8c-7cc3-40af-b074-08d8f4c5cedf
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:22:49.1546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LAEpMN+e1Ax0G7JDjnk88SPb2FNXTFAViElj1NVVut+KpovI3M34G8P+EgTs+3HhhBBVZSoIbsmHcVxaQzXToA==
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
Cc: Alex Sierra <alex.sierra@amd.com>, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

When application explicitly call unmap or unmap from mmput when
application exit, driver will receive MMU_NOTIFY_UNMAP event to remove
svm range from process svms object tree and list first, unmap from GPUs
(in the following patch).

Split the svm ranges to handle partial unmapping of svm ranges. To
avoid deadlocks, updating MMU notifiers, range lists and interval trees
is done in a deferred worker. New child ranges are attached to their
parent range's child_list until the worker can update the
svm_range_list. svm_range_set_attr flushes deferred work and takes the
mmap_write_lock to guarantee that it has an up-to-date svm_range_list.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h |   3 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c  | 285 +++++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h  |  18 ++
 3 files changed, 305 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 7c1d7789b91e..0d19a13fc227 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -735,6 +735,9 @@ struct svm_range_list {
 	struct mutex			lock;
 	struct rb_root_cached		objects;
 	struct list_head		list;
+	struct work_struct		deferred_list_work;
+	struct list_head		deferred_range_list;
+	spinlock_t			deferred_list_lock;
 };
 
 /* Process data */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index c6a9766b97a6..ddb1e2a29881 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -136,6 +136,8 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
 	INIT_LIST_HEAD(&prange->update_list);
 	INIT_LIST_HEAD(&prange->remove_list);
 	INIT_LIST_HEAD(&prange->insert_list);
+	INIT_LIST_HEAD(&prange->deferred_list);
+	INIT_LIST_HEAD(&prange->child_list);
 	mutex_init(&prange->lock);
 	svm_range_set_default_attributes(&prange->preferred_loc,
 					 &prange->prefetch_loc,
@@ -412,6 +414,17 @@ svm_range_split_head(struct svm_range *prange, struct svm_range *new,
 	return r;
 }
 
+void svm_range_add_child(struct svm_range *prange, struct mm_struct *mm,
+			 struct svm_range *pchild, enum svm_work_list_ops op)
+{
+	pr_debug("add child 0x%p [0x%lx 0x%lx] to prange 0x%p child list %d\n",
+		 pchild, pchild->start, pchild->last, prange, op);
+
+	pchild->work_item.mm = mm;
+	pchild->work_item.op = op;
+	list_add_tail(&pchild->child_list, &prange->child_list);
+}
+
 /*
  * Validation+GPU mapping with concurrent invalidation (MMU notifiers)
  *
@@ -471,6 +484,30 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 	return r;
 }
 
+/**
+ * svm_range_list_lock_and_flush_work - flush pending deferred work
+ *
+ * @svms: the svm range list
+ * @mm: the mm structure
+ *
+ * Context: Returns with mmap write lock held, pending deferred work flushed
+ *
+ */
+static void
+svm_range_list_lock_and_flush_work(struct svm_range_list *svms,
+				   struct mm_struct *mm)
+{
+retry_flush_work:
+	flush_work(&svms->deferred_list_work);
+	mmap_write_lock(mm);
+
+	if (list_empty(&svms->deferred_range_list))
+		return;
+	mmap_write_unlock(mm);
+	pr_debug("retry flush\n");
+	goto retry_flush_work;
+}
+
 struct svm_range *svm_range_clone(struct svm_range *old)
 {
 	struct svm_range *new;
@@ -611,15 +648,255 @@ svm_range_handle_overlap(struct svm_range_list *svms, struct svm_range *new,
 	return r;
 }
 
+static void
+svm_range_update_notifier_and_interval_tree(struct mm_struct *mm,
+					    struct svm_range *prange)
+{
+	unsigned long start;
+	unsigned long last;
+
+	start = prange->notifier.interval_tree.start >> PAGE_SHIFT;
+	last = prange->notifier.interval_tree.last >> PAGE_SHIFT;
+
+	if (prange->start == start && prange->last == last)
+		return;
+
+	pr_debug("up notifier 0x%p prange 0x%p [0x%lx 0x%lx] [0x%lx 0x%lx]\n",
+		  prange->svms, prange, start, last, prange->start,
+		  prange->last);
+
+	if (start != 0 && last != 0) {
+		interval_tree_remove(&prange->it_node, &prange->svms->objects);
+		svm_range_remove_notifier(prange);
+	}
+	prange->it_node.start = prange->start;
+	prange->it_node.last = prange->last;
+
+	interval_tree_insert(&prange->it_node, &prange->svms->objects);
+	svm_range_add_notifier_locked(mm, prange);
+}
+
+static void
+svm_range_handle_list_op(struct svm_range_list *svms, struct svm_range *prange)
+{
+	struct mm_struct *mm = prange->work_item.mm;
+
+	switch (prange->work_item.op) {
+	case SVM_OP_NULL:
+		pr_debug("NULL OP 0x%p prange 0x%p [0x%lx 0x%lx]\n",
+			 svms, prange, prange->start, prange->last);
+		break;
+	case SVM_OP_UNMAP_RANGE:
+		pr_debug("remove 0x%p prange 0x%p [0x%lx 0x%lx]\n",
+			 svms, prange, prange->start, prange->last);
+		svm_range_unlink(prange);
+		svm_range_remove_notifier(prange);
+		svm_range_free(prange);
+		break;
+	case SVM_OP_UPDATE_RANGE_NOTIFIER:
+		pr_debug("update notifier 0x%p prange 0x%p [0x%lx 0x%lx]\n",
+			 svms, prange, prange->start, prange->last);
+		svm_range_update_notifier_and_interval_tree(mm, prange);
+		break;
+	case SVM_OP_ADD_RANGE:
+		pr_debug("add 0x%p prange 0x%p [0x%lx 0x%lx]\n", svms, prange,
+			 prange->start, prange->last);
+		svm_range_add_to_svms(prange);
+		svm_range_add_notifier_locked(mm, prange);
+		break;
+	default:
+		WARN_ONCE(1, "Unknown prange 0x%p work op %d\n", prange,
+			 prange->work_item.op);
+	}
+}
+
+static void svm_range_deferred_list_work(struct work_struct *work)
+{
+	struct svm_range_list *svms;
+	struct svm_range *prange;
+	struct mm_struct *mm;
+
+	svms = container_of(work, struct svm_range_list, deferred_list_work);
+	pr_debug("enter svms 0x%p\n", svms);
+
+	spin_lock(&svms->deferred_list_lock);
+	while (!list_empty(&svms->deferred_range_list)) {
+		prange = list_first_entry(&svms->deferred_range_list,
+					  struct svm_range, deferred_list);
+		spin_unlock(&svms->deferred_list_lock);
+		pr_debug("prange 0x%p [0x%lx 0x%lx] op %d\n", prange,
+			 prange->start, prange->last, prange->work_item.op);
+
+		mm = prange->work_item.mm;
+		mmap_write_lock(mm);
+		mutex_lock(&svms->lock);
+
+		/* Remove from deferred_list must be inside mmap write lock,
+		 * otherwise, svm_range_list_lock_and_flush_work may hold mmap
+		 * write lock, and continue because deferred_list is empty, then
+		 * deferred_list handle is blocked by mmap write lock.
+		 */
+		spin_lock(&svms->deferred_list_lock);
+		list_del_init(&prange->deferred_list);
+		spin_unlock(&svms->deferred_list_lock);
+
+		while (!list_empty(&prange->child_list)) {
+			struct svm_range *pchild;
+
+			pchild = list_first_entry(&prange->child_list,
+						struct svm_range, child_list);
+			pr_debug("child prange 0x%p op %d\n", pchild,
+				 pchild->work_item.op);
+			list_del_init(&pchild->child_list);
+			svm_range_handle_list_op(svms, pchild);
+		}
+
+		svm_range_handle_list_op(svms, prange);
+		mutex_unlock(&svms->lock);
+		mmap_write_unlock(mm);
+
+		spin_lock(&svms->deferred_list_lock);
+	}
+	spin_unlock(&svms->deferred_list_lock);
+
+	pr_debug("exit svms 0x%p\n", svms);
+}
+
+void
+svm_range_add_list_work(struct svm_range_list *svms, struct svm_range *prange,
+			struct mm_struct *mm, enum svm_work_list_ops op)
+{
+	spin_lock(&svms->deferred_list_lock);
+	/* if prange is on the deferred list */
+	if (!list_empty(&prange->deferred_list)) {
+		pr_debug("update exist prange 0x%p work op %d\n", prange, op);
+		WARN_ONCE(prange->work_item.mm != mm, "unmatch mm\n");
+		if (op != SVM_OP_NULL &&
+		    prange->work_item.op != SVM_OP_UNMAP_RANGE)
+			prange->work_item.op = op;
+	} else {
+		prange->work_item.op = op;
+		prange->work_item.mm = mm;
+		list_add_tail(&prange->deferred_list,
+			      &prange->svms->deferred_range_list);
+		pr_debug("add prange 0x%p [0x%lx 0x%lx] to work list op %d\n",
+			 prange, prange->start, prange->last, op);
+	}
+	spin_unlock(&svms->deferred_list_lock);
+}
+
+void schedule_deferred_list_work(struct svm_range_list *svms)
+{
+	spin_lock(&svms->deferred_list_lock);
+	if (!list_empty(&svms->deferred_range_list))
+		schedule_work(&svms->deferred_list_work);
+	spin_unlock(&svms->deferred_list_lock);
+}
+
+static void
+svm_range_unmap_split(struct mm_struct *mm, struct svm_range *parent,
+		      struct svm_range *prange, unsigned long start,
+		      unsigned long last)
+{
+	struct svm_range *head;
+	struct svm_range *tail;
+
+	if (prange->work_item.op == SVM_OP_UNMAP_RANGE) {
+		pr_debug("prange 0x%p [0x%lx 0x%lx] is already freed\n", prange,
+			 prange->start, prange->last);
+		return;
+	}
+	if (start > prange->last || last < prange->start)
+		return;
+
+	head = tail = prange;
+	if (start > prange->start)
+		svm_range_split(prange, prange->start, start - 1, &tail);
+	if (last < tail->last)
+		svm_range_split(tail, last + 1, tail->last, &head);
+
+	if (head != prange && tail != prange) {
+		svm_range_add_child(parent, mm, head, SVM_OP_UNMAP_RANGE);
+		svm_range_add_child(parent, mm, tail, SVM_OP_ADD_RANGE);
+	} else if (tail != prange) {
+		svm_range_add_child(parent, mm, tail, SVM_OP_UNMAP_RANGE);
+	} else if (head != prange) {
+		svm_range_add_child(parent, mm, head, SVM_OP_UNMAP_RANGE);
+	} else if (parent != prange) {
+		prange->work_item.op = SVM_OP_UNMAP_RANGE;
+	}
+}
+
+static void
+svm_range_unmap_from_cpu(struct mm_struct *mm, struct svm_range *prange,
+			 unsigned long start, unsigned long last)
+{
+	struct svm_range_list *svms;
+	struct svm_range *pchild;
+	struct kfd_process *p;
+	bool unmap_parent;
+
+	p = kfd_lookup_process_by_mm(mm);
+	if (!p)
+		return;
+	svms = &p->svms;
+
+	pr_debug("svms 0x%p prange 0x%p [0x%lx 0x%lx] [0x%lx 0x%lx]\n", svms,
+		 prange, prange->start, prange->last, start, last);
+
+	unmap_parent = start <= prange->start && last >= prange->last;
+
+	list_for_each_entry(pchild, &prange->child_list, child_list)
+		svm_range_unmap_split(mm, prange, pchild, start, last);
+	svm_range_unmap_split(mm, prange, prange, start, last);
+
+	if (unmap_parent)
+		svm_range_add_list_work(svms, prange, mm, SVM_OP_UNMAP_RANGE);
+	else
+		svm_range_add_list_work(svms, prange, mm,
+					SVM_OP_UPDATE_RANGE_NOTIFIER);
+	schedule_deferred_list_work(svms);
+
+	kfd_unref_process(p);
+}
+
 /**
  * svm_range_cpu_invalidate_pagetables - interval notifier callback
  *
+ * MMU range unmap notifier to remove svm ranges
  */
 static bool
 svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
 				    const struct mmu_notifier_range *range,
 				    unsigned long cur_seq)
 {
+	struct svm_range *prange;
+	unsigned long start;
+	unsigned long last;
+
+	if (range->event == MMU_NOTIFY_RELEASE)
+		return true;
+
+	start = mni->interval_tree.start;
+	last = mni->interval_tree.last;
+	start = (start > range->start ? start : range->start) >> PAGE_SHIFT;
+	last = (last < (range->end - 1) ? last : range->end - 1) >> PAGE_SHIFT;
+	pr_debug("[0x%lx 0x%lx] range[0x%lx 0x%lx] notifier[0x%lx 0x%lx] %d\n",
+		 start, last, range->start >> PAGE_SHIFT,
+		 (range->end - 1) >> PAGE_SHIFT,
+		 mni->interval_tree.start >> PAGE_SHIFT,
+		 mni->interval_tree.last >> PAGE_SHIFT, range->event);
+
+	prange = container_of(mni, struct svm_range, notifier);
+
+	switch (range->event) {
+	case MMU_NOTIFY_UNMAP:
+		svm_range_unmap_from_cpu(mni->mm, prange, start, last);
+		break;
+	default:
+		break;
+	}
+
 	return true;
 }
 
@@ -628,6 +905,9 @@ void svm_range_list_fini(struct kfd_process *p)
 	mutex_destroy(&p->svms.lock);
 
 	pr_debug("pasid 0x%x svms 0x%p\n", p->pasid, &p->svms);
+
+	/* Ensure list work is finished before process is destroyed */
+	flush_work(&p->svms.deferred_list_work);
 }
 
 int svm_range_list_init(struct kfd_process *p)
@@ -637,6 +917,9 @@ int svm_range_list_init(struct kfd_process *p)
 	svms->objects = RB_ROOT_CACHED;
 	mutex_init(&svms->lock);
 	INIT_LIST_HEAD(&svms->list);
+	INIT_WORK(&svms->deferred_list_work, svm_range_deferred_list_work);
+	INIT_LIST_HEAD(&svms->deferred_range_list);
+	spin_lock_init(&svms->deferred_list_lock);
 
 	return 0;
 }
@@ -754,7 +1037,7 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 
 	mutex_lock(&process_info->lock);
 
-	mmap_write_lock(mm);
+	svm_range_list_lock_and_flush_work(svms, mm);
 
 	if (!svm_range_is_valid(mm, start, size)) {
 		pr_debug("invalid range\n");
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index f77a27a9fb27..aa4430f3fa08 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -32,6 +32,18 @@
 #include "amdgpu.h"
 #include "kfd_priv.h"
 
+enum svm_work_list_ops {
+	SVM_OP_NULL,
+	SVM_OP_UNMAP_RANGE,
+	SVM_OP_UPDATE_RANGE_NOTIFIER,
+	SVM_OP_ADD_RANGE
+};
+
+struct svm_work_list_item {
+	enum svm_work_list_ops op;
+	struct mm_struct *mm;
+};
+
 /**
  * struct svm_range - shared virtual memory range
  *
@@ -53,6 +65,9 @@
  * @actual_loc: the actual location, 0 for CPU, or GPU id
  * @granularity:migration granularity, log2 num pages
  * @notifier:   register mmu interval notifier
+ * @work_item:  deferred work item information
+ * @deferred_list: list header used to add range to deferred list
+ * @child_list: list header for split ranges which are not added to svms yet
  * @bitmap_access: index bitmap of GPUs which can access the range
  * @bitmap_aip: index bitmap of GPUs which can access the range in place
  *
@@ -78,6 +93,9 @@ struct svm_range {
 	uint32_t			actual_loc;
 	uint8_t				granularity;
 	struct mmu_interval_notifier	notifier;
+	struct svm_work_list_item	work_item;
+	struct list_head		deferred_list;
+	struct list_head		child_list;
 	DECLARE_BITMAP(bitmap_access, MAX_GPU_INSTANCE);
 	DECLARE_BITMAP(bitmap_aip, MAX_GPU_INSTANCE);
 };
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
