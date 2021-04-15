Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B99135FF4B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49CA86E997;
	Thu, 15 Apr 2021 01:24:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDEF6E98E;
 Thu, 15 Apr 2021 01:24:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSHsBkxJ1FRXy4LgsCSSXp7Kua3UnciUmPIH1RkCAWyHwMbKkHEJ0QqqBA1255BRhlPrgteR4DImAHhzeVOxN6wriPlc2uykzh+CihZNKsFowzX5w+MbN6FjKOCOzflWG08ALW3eMxg/lZyH1WFDuuhF0ZucScZm44uUbXFJuJTPVk+joHXAhO56m6bRDeU9VYve1QK1dGMfW183ZNkYJiVR3EmKj4epXH3z5OWMTCW/58QRru0AQYpn5Z8HRA0fFBAocdRmNAx7nS2fT+Hw1pB6fWBh7GYnvITSrY7P0WzKLhcwgTPeZ8ZwJPttpQ83XEYLwB0vumD9IP7GHYHcOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shMPGQNJkSSpjodfHfvK5l+u3SCbSqBXEAa5TlDL5L0=;
 b=bVP8cRRKcgCQuO98CtzWyYSp0FOrDmTvJm6SdeGlXKZzsVK/7QOzadbxRwg2VPC24iKuE98wu5bZElOGz5mwAfXsIVYICL6ICNYtdyWauClmhlR6AjvZ1CSfjE8DoHKJIkoE+6iHZG5sq8YXNdmS7wUF5T+oix/kVygBgo/xWUoQsaiWCkZdBqu2fyjXVg7Aa5C4klzvxjqIF908KsCCLepoDXuhkjgP3+H1xcByMSXLzUi+PGT44MvLEOjIYV93gGD4rhdH0ANugEiDxjZz8mJcM0Ndb9m57m7SvWnPAy6bm8IO1++s4lgiGEWzxcFxa1AYYNmXUwf2uu+ZAO+J+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shMPGQNJkSSpjodfHfvK5l+u3SCbSqBXEAa5TlDL5L0=;
 b=KY9scOURn8SeCqMj4nI8tPnLILYwKAUqU8711YCtIkam5UO+tPg7tU8/DhTCntU82PeoIn3sp/9BYnjPrP1vwbm3N5Imn8P/akVBKwDYDDFNtWNO4mDmiXIyYbXL1G92AVno20pFC5+ByTRLfLQONjM+OBxIjh1rNi8pSmDahi8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3839.namprd12.prod.outlook.com (2603:10b6:208:168::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Thu, 15 Apr
 2021 01:23:59 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:23:59 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 08/34] drm/amdkfd: deregister svm range
Date: Wed, 14 Apr 2021 21:23:11 -0400
Message-Id: <20210415012337.1755-9-Felix.Kuehling@amd.com>
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
 Transport; Thu, 15 Apr 2021 01:23:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a2f94e8-8be3-4003-9982-08d8ffad24df
X-MS-TrafficTypeDiagnostic: MN2PR12MB3839:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3839E9371341922E96E34452924D9@MN2PR12MB3839.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z2Is6Md8G65YZM9b7Z6PrdZ/qx51lh3xYBuR8qpoub1g53hGNFSHRaFFd4EfzU358j45El2vUqLG+aADCN9Sy997c09sxy0fp98xgURuCr59RIwVpsUzMHi/0kMHvoTdzROmEgAG1rcOB3JMjhjkTHlK95cFjGge0YulD7+julL6l7M0vnYZVZc3Ea2nz4RCR7bfyzJHkHyDQHAHWMD3Rm5MhZSGCHvTPoXi8oGAhwOLsluckTu40IQzOX9PHvCrw2KyFJ++rkmRhtU2WdbAoeUu4RPatms+EtOkFV8nPYFFwIR7NOd0RVhWMHyD35gUgwzu8E1cdDWcTbT/ZaZRC3A+GX3OwGPTpiRcvQIq9O//1jcSV2R6OKOt18LvrEvbhJIywQ7EfFWdjcWBe1octy49FVgR4boLGNaNR1G5v4ZDB9xiGhi18fOaTTPS+gnQS8UBp7TbB4UdGjpPDYEYUROOX9k7JdPDdyO5iwj3NeUaF8Qxwl4m3gVgRWvBz/BpFjMBmLo239VwcaMhyjH13YwBbuioqh9w/lHr7B8groHu+en9BbK79PfmfqPf7HVBqRnYjMoXEpI3DkOkbUEH9EH6HfRcivxXz6NnapZjUt5CGTErYVFSHwW971LkrwE1dw0WX5FaadGBW2k9CvBz9iDkzDPWYgQnGw8XVWDMfVs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(2616005)(86362001)(26005)(956004)(52116002)(8676002)(316002)(83380400001)(4326008)(5660300002)(38100700002)(38350700002)(6666004)(478600001)(450100002)(8936002)(7696005)(66476007)(6486002)(66556008)(36756003)(54906003)(66946007)(2906002)(30864003)(1076003)(16526019)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?oKU7sP7SkCAtT4Xz0Zgwuj6BsOLHV/lo6+NtBXWEejGa+1oOnOGYvy35nrxN?=
 =?us-ascii?Q?kSKP5sjA9IXm40tQF2GBuUKdOaYYKSQsSKqb7WGR23rkv5qGgodhTKCecBOb?=
 =?us-ascii?Q?HoSP+ixh1aFy1TYNAagtdno8cTt5weYC/S+7VM7z1Ms+HcLwDisX3rBav6QC?=
 =?us-ascii?Q?isX0qi1oiBL0tP0OvIByqT2RfbMz0p3eoh1pHv9TxGnd3a7us56+bJ1VcpxG?=
 =?us-ascii?Q?8a0RxNV9Qddq0eKKokytLiTYqZRNMImhpZNVr157BpDJBLveMmV4djg6Olaw?=
 =?us-ascii?Q?ahMnAYtLSDSdsSCG7wDGgrDC/a0tQ6OtZs8Gy09C9C+3U2QzHfkkWVoaTZ70?=
 =?us-ascii?Q?RD5VBvwaOx+6KSRnsU3c7zZqcE9taTPG+QujarULINRQyM9mmnAZ+ZckM5Hz?=
 =?us-ascii?Q?o+jTkUcPlCLToaQOgO2cCM1eUiMbHRGEWxnw23e96T7MlUufcPAoaZORPadI?=
 =?us-ascii?Q?Vdo6sZA0tomFhE6NjUTC27FLeWk0NDOtXdiQJ30Nr+jWmTJ5ow70soUEcgIL?=
 =?us-ascii?Q?0eymrGFH8SEBbuFJt6Q4xFqI/5zlQZ28maOZUn6QsS32YsjWukp9zmkPzLPx?=
 =?us-ascii?Q?k6D/PZ94GQq4ykZkQk4bY1ridJbG6+LmXgFPrU2i82eTeolZom9lu/bM5TA1?=
 =?us-ascii?Q?qr5yJmPL3gTxXGv2NqfogVeSfyC+AudY7xEMeay5Kt0Z4g2lZGWNwdOwDWyS?=
 =?us-ascii?Q?7HMSNmZMnOrQGzMygqjEiCe0XzCIlAegU/rmele6IptHKuaPSETqtzMSIhSe?=
 =?us-ascii?Q?G51Ltohpfj11AvUA+UHsEii53N2EsI39SmJzPf6Anp/7sFaWcsgqkjRiZtky?=
 =?us-ascii?Q?p69A9ltgVhI7YodSdUrsZhly3Ca8kWWSdyMome1SB81ZBvpGVg6Eu36gHJIu?=
 =?us-ascii?Q?p/p4IhictN3N7JkPuMz9Me6/jD4xvQln15GqoukqUFxbNF+iwsQpDuXWgt2E?=
 =?us-ascii?Q?8T6CmJfn6YoEk4l4ZaJztoB9gfGJ3Mcg/q90pp2bruqNSayrrHtaxPrXEoaK?=
 =?us-ascii?Q?k+xNzR28xFmYm/soePbZosUwdscVAWqB+xhLaoXPqbcew2ff6sSstwg+1scd?=
 =?us-ascii?Q?QrTdEi6tfH7lWiKxJdd/84FajLnMgyCl5PDB4r+eOq6mRz2+gBxayI6pcVKe?=
 =?us-ascii?Q?EBX61lgpLSVWO4AhhG2bk+uqm2yZIQk2vR7cMKHVph+oYj427w9m0Zo+fKbN?=
 =?us-ascii?Q?kN/2zd4tBwJd158CvSWHRd+nW+4ql6w+03tRVFoR7vfsW2mtaoEQS4vazDKc?=
 =?us-ascii?Q?9WDjRoFkLrumKwJ5FPNkWXb6OT9ElkbVc0ueeZlX5XwLgRpfGsyAtX7vwZm8?=
 =?us-ascii?Q?POyQQ9mUh30mGDVOrqn72Nci?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a2f94e8-8be3-4003-9982-08d8ffad24df
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:23:58.7527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYQ4gI8zCiAK/tUvq8IX0tmx9nW8QTc2E0A+WtvGjgsV8oFSZQ2oa+JfoZxaLsY+dimiPz2LqugkMEwDnokMbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3839
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
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h |   3 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c  | 291 +++++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h  |  18 ++
 3 files changed, 311 insertions(+), 1 deletion(-)

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
index db72b767b958..c4decfbb2427 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -137,6 +137,8 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
 	INIT_LIST_HEAD(&prange->update_list);
 	INIT_LIST_HEAD(&prange->remove_list);
 	INIT_LIST_HEAD(&prange->insert_list);
+	INIT_LIST_HEAD(&prange->deferred_list);
+	INIT_LIST_HEAD(&prange->child_list);
 	mutex_init(&prange->lock);
 	svm_range_set_default_attributes(&prange->preferred_loc,
 					 &prange->prefetch_loc,
@@ -411,6 +413,18 @@ svm_range_split_head(struct svm_range *prange, struct svm_range *new,
 	return r;
 }
 
+static void
+svm_range_add_child(struct svm_range *prange, struct mm_struct *mm,
+		    struct svm_range *pchild, enum svm_work_list_ops op)
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
@@ -470,6 +484,30 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
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
 static struct svm_range *svm_range_clone(struct svm_range *old)
 {
 	struct svm_range *new;
@@ -610,15 +648,260 @@ svm_range_handle_overlap(struct svm_range_list *svms, struct svm_range *new,
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
+static void
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
+static void schedule_deferred_list_work(struct svm_range_list *svms)
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
+	svm_range_lock(prange);
+	mmu_interval_set_seq(mni, cur_seq);
+
+	switch (range->event) {
+	case MMU_NOTIFY_UNMAP:
+		svm_range_unmap_from_cpu(mni->mm, prange, start, last);
+		break;
+	default:
+		break;
+	}
+
+	svm_range_unlock(prange);
+
 	return true;
 }
 
@@ -627,6 +910,9 @@ void svm_range_list_fini(struct kfd_process *p)
 	mutex_destroy(&p->svms.lock);
 
 	pr_debug("pasid 0x%x svms 0x%p\n", p->pasid, &p->svms);
+
+	/* Ensure list work is finished before process is destroyed */
+	flush_work(&p->svms.deferred_list_work);
 }
 
 int svm_range_list_init(struct kfd_process *p)
@@ -636,6 +922,9 @@ int svm_range_list_init(struct kfd_process *p)
 	svms->objects = RB_ROOT_CACHED;
 	mutex_init(&svms->lock);
 	INIT_LIST_HEAD(&svms->list);
+	INIT_WORK(&svms->deferred_list_work, svm_range_deferred_list_work);
+	INIT_LIST_HEAD(&svms->deferred_range_list);
+	spin_lock_init(&svms->deferred_list_lock);
 
 	return 0;
 }
@@ -753,7 +1042,7 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 
 	mutex_lock(&process_info->lock);
 
-	mmap_write_lock(mm);
+	svm_range_list_lock_and_flush_work(svms, mm);
 
 	if (!svm_range_is_valid(mm, start, size)) {
 		pr_debug("invalid range\n");
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 10c73348c2c0..173e93e138a9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -33,6 +33,18 @@
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
@@ -54,6 +66,9 @@
  * @actual_loc: the actual location, 0 for CPU, or GPU id
  * @granularity:migration granularity, log2 num pages
  * @notifier:   register mmu interval notifier
+ * @work_item:  deferred work item information
+ * @deferred_list: list header used to add range to deferred list
+ * @child_list: list header for split ranges which are not added to svms yet
  * @bitmap_access: index bitmap of GPUs which can access the range
  * @bitmap_aip: index bitmap of GPUs which can access the range in place
  *
@@ -79,6 +94,9 @@ struct svm_range {
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
