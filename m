Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C88354A60
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468296E223;
	Tue,  6 Apr 2021 01:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D08D6E201;
 Tue,  6 Apr 2021 01:46:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dC5YYciTERXukIwrlrxc+iOc/dsl4ZkXJWMQGdsCWcwyzxct8ZRJ5sEqPnpMJ40qmIac/gKWyfrmZ9DJINiVqXMd+7NuEI2e1jfoLtI/DgygEKO6bZrxTionE1mcC95CC/yPOYUEsHNDu685NoilKMj60SmpQGOdvFqYtdHci/aASoy4KJ5e0Vdeli5x2FUxZ0M3d7tyQ8B4Wi0/mZgfANcKRoMKhZulijIZUSECARGWx0d/4BbdyZZguuG3AxK3GruVLJ7oY3Zjhi7SwvfA84vZA7nihkS5Es/JbPmk6mRSigWaYFLd7YKjWFxTh0oMR6FWH8A5MZNvXao42r1+tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rdVxN0zE/Ok4z9d3zvAbFEwLj4wCDaw8WH5FM+3eJo=;
 b=H8UEZyML6Tr8BpvMlPDgnhUtP1RT5IRvx/z2/g1OHKawP5NnKgz2/7Ukdi0pRh5Kt/bkPzWgQdvGgMR6d8Fs6od0/U9bPKr+17CCqVsnOZDR8mED5vTe84IrOOjEhs2j3z9Fz2SLEH1y3iyDPupya9ssRopUkKK6d4IVHf3UmXPpcZ+Vyjz2X2SSEr7FR4xZ9UT+4ZTZk2a9O6qTktLq180j2qC0xTQ8BL7eycxEfy4W1gkx0Zy10t+SW8v6HTi8Nz1B7uwHzW/aslTcesa8Jbe5Ksq9Aq9IRQosym/9wYQBW5x58S3I2vrlYSeTDoG0WiX/v3d8EdDoazo03VvMFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rdVxN0zE/Ok4z9d3zvAbFEwLj4wCDaw8WH5FM+3eJo=;
 b=G+5yNlD9C4fXdaIFtqTXJ+5BHDaA/v0vgjkOtv2zorr/7RehqJQrrLJMtLinmi+7SodPsMeQ727VkLNEP82rgjvDISY0bOLPMNHszlVkdsqqDyg13aO2VxFyJkypWbqTLP+l0W5+BDmRGhUh+sMNAALL3mZnZLr5F2/P9qfI6vo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3773.namprd12.prod.outlook.com (2603:10b6:208:164::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 01:46:58 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:46:58 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 08/34] drm/amdkfd: deregister svm range
Date: Mon,  5 Apr 2021 21:46:03 -0400
Message-Id: <20210406014629.25141-9-Felix.Kuehling@amd.com>
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
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:46:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32b99246-64e4-4f98-57a9-08d8f89ddcf7
X-MS-TrafficTypeDiagnostic: MN2PR12MB3773:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB377310EF359ADFCAEAD8A9EA92769@MN2PR12MB3773.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DQFyKCLOix+ZaepqcmxxITVYTJKXzD9qKAlW/tQpzwngJQBLeuSW3AZQ4dPtYFQ906LBo8OeHh578ReMb0/Yt0guzIKQcfGxvKIxe3dvOaZg/Mw3XIfYBdBwmNgYEtVdWnR7FE18iApu3tXbtGz45yy0MNOlRrvF6S6MpkfY6efLhHHWN5OzS3hWnthE19uUZhIebOhnJPWj7Syt+gsjjSeIyZMINZInCCGj2onaGs+MOaBp7awdT8aahj6LjpDA3Zqz74OoMEoxxN4Hxu8m56gREeb3H2Tw25azzw/ssoWrvhp6yQllStT+xTcN/3EvUIToVY7SJNOC7upKX9B0sEMjGeuI1UhiIl9rYKX4H718r24zuQg4O3/Ydg5fa8B9bmfDTG1SDe6qHdo3kcXol1P6NJSLCZ6RkqDVtklcSNHv5WtYVjSJwsrj/K2OQert3sHuhH05501P126Odx35VODw4znROPsrfyA4fNeaUmO4Z2IHCDfYZBMLXIuOpUrVvVCyqk2+BfNguPb6WZA87w3YquQvXiH2ZEtSHayIj0qvMmDgU7DjdQVD0aAdfjJhu3N3inL2MU0/kcrEsO3OX6n+HEum5+Ko+VX3PVVmO6x+nbV7GTfHUX22eqQnR6uBPg8oTdEhvMx/Ix9m1RyyqTYr/e8ektYd6KeA+3Kgdkk6KWGdXysIiFRBBCvwgPoC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(30864003)(478600001)(5660300002)(6486002)(316002)(52116002)(66946007)(1076003)(36756003)(2906002)(16526019)(186003)(26005)(450100002)(8676002)(8936002)(86362001)(66556008)(66476007)(54906003)(4326008)(956004)(2616005)(38100700001)(83380400001)(6666004)(7696005)(38350700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?PoT5GsqaO8iLTBBA+wB+lc73GgeQcrkBqE42enS1HdcKGxVtFGACoCllxywe?=
 =?us-ascii?Q?ao3E+RnaQk/YVAZfRodAQqckqLI7GMa8nxm6R9f2teSFTmykPwepJ0qQsOir?=
 =?us-ascii?Q?u8oFeLgPRKVJLSqkUWpkzSN1xVAKZ03UYz4O/4dEm31gk/ztBVYC0P42MjLV?=
 =?us-ascii?Q?0NNIgAdBLyPmvgtrfjIBT+l8pCeqrvbuLLsFV+oyIh3HJtXAzugDTj3GrqE4?=
 =?us-ascii?Q?AC87dnJa10yHUFHRztAkjsLycb6TRA1mONpudFlSSAUXrhk9e+kGPFUGcRXa?=
 =?us-ascii?Q?20ez6EioPm+1EJrUwadW44Mc/80wQA0y9bqJpru6QQw9r29v8LaBwAfcHzXx?=
 =?us-ascii?Q?HjJn3pZbdpYY6c/PHg9md0DSkM0nDIRx7Dofh0IlVC+wQN47ErJJE2oPdIvg?=
 =?us-ascii?Q?aJHd/yAqJD5nxNSuhU5m7TkNf1Y0BTFgD0jClYSHbBhC4Y6oTlhUsJA2v1wq?=
 =?us-ascii?Q?40enK+CwtjNJVctRRr9YgT163Rv+YRMg2ezDn8FFn2AL7Pfg+xtXICRycfxc?=
 =?us-ascii?Q?pBT/jop6bUPB4BYSqc+k8UwkB4pGtS7u66BCSYLXADcdSdnfvMhPXAlnhxJY?=
 =?us-ascii?Q?O9BScqIphQ0e/waiUzpoFqh7ugELfSaxOxHJ0YhTycSBOzK3NIIl4fEXc795?=
 =?us-ascii?Q?4GNE9KmbqF3PRzZL1A/+Bd2eyyC0Nwpl5Fbs5t2//7F7cSfYeojCqWTGBfJm?=
 =?us-ascii?Q?DauAiHaphFuSru8XDtYwSyftn8VEkRXNM8H4Rt0/JCLyOmyncs91NehBmuhS?=
 =?us-ascii?Q?v/7Vk0GEBaBNaA4G8T0zylWjcJxPeFjRXlxtgvep5G190nfUpr6OrFsq+Rl/?=
 =?us-ascii?Q?1pEf99DjEPWiO+dYq+pfAO/G2qNA21wWPrmO+Ab9mefYCLM/NEWcTnWlF1U4?=
 =?us-ascii?Q?vBgyMbSraGz+C74FBRl/duXDyJ0gzfWDYJbLJq9lv6nhsbNJqbcqw5/cahNa?=
 =?us-ascii?Q?kiGIO8+enAYfGtiDJfZNnna3q2T63d44TaKhfeb1NS+hMDpBxE5iZnKSVjty?=
 =?us-ascii?Q?oP+kO2oIqiux1cM5H0dRGmbC+VhckbPNqGkJRoLtrsxqKzNLINhSFuL7oGow?=
 =?us-ascii?Q?gz8mzcuDR4F59lA8frGR6LT7nEacw87d+rost2pFfnHplR4/cGYUKKX1QZ36?=
 =?us-ascii?Q?CTpa5kVCfzzvNxfmf6cI0+1v7k572JtqUP7qvrApdULgxRq+NIJyL3V3uyE7?=
 =?us-ascii?Q?sXCzLo/KoM9y9ZEsZePw/+bHMPbEoAWuD27YSANm2d05VP/chpp5T5tPAg0/?=
 =?us-ascii?Q?6hcgokC2OOQDyibbwIDR2v6VdLdzcri2ZFJgeVPu4rBo505r5k4TtazHXm9A?=
 =?us-ascii?Q?5x2YppZj7vQSHXOThTQQaEeF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b99246-64e4-4f98-57a9-08d8f89ddcf7
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:46:57.5378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t2NzgCQCW2DhXCpio0tHWG0j4kukLiC7+6iASek93X3FYG9hWsP7MgKtgp4nCrZ6xa15/EGJ/Wte5RAufrKyjw==
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
index 9cdc030fe5c8..9eaff28bdc13 100644
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
@@ -412,6 +414,18 @@ svm_range_split_head(struct svm_range *prange, struct svm_range *new,
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
@@ -471,6 +485,30 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
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
@@ -611,15 +649,260 @@ svm_range_handle_overlap(struct svm_range_list *svms, struct svm_range *new,
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
 
@@ -628,6 +911,9 @@ void svm_range_list_fini(struct kfd_process *p)
 	mutex_destroy(&p->svms.lock);
 
 	pr_debug("pasid 0x%x svms 0x%p\n", p->pasid, &p->svms);
+
+	/* Ensure list work is finished before process is destroyed */
+	flush_work(&p->svms.deferred_list_work);
 }
 
 int svm_range_list_init(struct kfd_process *p)
@@ -637,6 +923,9 @@ int svm_range_list_init(struct kfd_process *p)
 	svms->objects = RB_ROOT_CACHED;
 	mutex_init(&svms->lock);
 	INIT_LIST_HEAD(&svms->list);
+	INIT_WORK(&svms->deferred_list_work, svm_range_deferred_list_work);
+	INIT_LIST_HEAD(&svms->deferred_range_list);
+	spin_lock_init(&svms->deferred_list_lock);
 
 	return 0;
 }
@@ -754,7 +1043,7 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 
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
