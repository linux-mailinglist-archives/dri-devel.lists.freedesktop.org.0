Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2B0350DA4
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4986EC2B;
	Thu,  1 Apr 2021 04:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15D16EC2A;
 Thu,  1 Apr 2021 04:22:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePlihg95aPioKVsXu4+4W5bgqqOBe8sXbUeifiix5cV8H1F0/tlAxby/u/kTD7mwczEK+eGVB5v+BiSGwM+MRzxIokMTIk132kn7xFa43w9WRvKON+znzOs+QPUr4CnY/gFkIR6ER3WEaASHfNE7hlQKq2CILD7QOcYqWMsZt74GplqJl38mlAzLj7JLsjMNoupRvv/5ESKHnM829i81fIbB8Ur/kVwXkunrw2QEL0U+iqHGsBsgMwpF2lokyEjtMPP8b3MSPpE+V0zZXM73TPqTrIoUTzDpl6+BXNIxpSGXP+5odReBUSoFjbeBgAgqE2CeN6p6vfBeAaaJE8M74Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bl4P46ox98C8lWclHtA/ywZH288C9PM0Ym8L4zt6kpY=;
 b=R1dhb3gNxXXJJmESwGrU9CH3BVeNjKynhrwt5W5fhIe6aMgFca0YqXPqN1XDLFQwvREprj+5YYMYpQznq4QmrkVC7BnTIqM1gjxc9ZSN03h4B/9qISib+73MwQ+1jcHvOLK6S3HAGBd/pT9DxUoRr3qSZAqscWnVpSYFwlYkAuC933I2vo4umQthvYF0v/yZm67+p1ygN7dQWJjzXjXoUAsXWHUwvhsa8yn6PciRPBp9E+n2Bov7LM4NekhzAR9+9h7iIim6Vo3zH7PD7tKfvMgtcAJtPOWSMskoz++bvJtEsjb2PXEj6ptyIkZi4ehr/hWOatqnA/0HYb32eBG7Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bl4P46ox98C8lWclHtA/ywZH288C9PM0Ym8L4zt6kpY=;
 b=Iwt16pwmA87XKinqJG+3+8AuT2AtU0byMJYmigdh3RP7b4uuNhGQuyQU3GFbeiVFtBixGADkq7+qcLMZydwMzTj0LhnpT/AxF/Z/x/X4WZ5bzLS3vaN5BNSp6olwVcNqvW87WLR7nB5LNWKkMt9KllMNrwWivGVV5QGV2BFYqQs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4916.namprd12.prod.outlook.com (2603:10b6:208:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Thu, 1 Apr
 2021 04:22:48 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:22:48 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 06/34] drm/amdkfd: validate svm range system memory
Date: Thu,  1 Apr 2021 00:22:00 -0400
Message-Id: <20210401042228.1423-7-Felix.Kuehling@amd.com>
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
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:22:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0787e521-8e27-428b-f259-08d8f4c5ce51
X-MS-TrafficTypeDiagnostic: BL0PR12MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB491600695F2E068069875522927B9@BL0PR12MB4916.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RmfGkOSuaSo2s4kCuYdcBXwu83G5WJLdRumwawKjeHjyd20tuu4iJoYc/t3KszGL4VAWBcIgQqCob4ZDfZUIHKABnwIwmgGbPINdxdy4K6FYGjo00OCFv2OIQiIQqLxgf4BhKIbZ6hVlPba4ApqXw4v8CnmLws90YPb3fnltoa61XKLfUW8Vf4f0mAxos/xHrsDWUgFsqe62aIugSAoUfyxvIjf/RYHsCZAsSjT5mp7YGBXxHD3oOLF1/zPICKZV7xsixuGVVQ/AD3r97BN+rtROstuFyHcAXRAta/hknTYqfV+FKLifffTum4Gsg8zjrgstN5lemVXQP2M66EcqpNSt13pNBhsRg62fCG63ohbDIe5aKQzJcxgghU2//JxXJz37+1P6BjZURz3W7Wzu5COXCAaBixz1Cem2mDQ/BPeHbIKQEkkB/my4AMwTFMp4p3AfBh3MpnW9hEds2ih5tRUoW+inJn0bj3poQXVXZrUQ3qV/xlckPKfsyiROjBzG/h5EV10Zk0U9cKiV0A9t4mRnft6EG4oew65dyU44pFNOtmMLrm3ZajIfrmt9ioVdyQrf96lUWf1nZ1695q0DPOVFT109AYz2EtRa79bYVO5oX5vRgkThc7CWqfxyRBJtO1A87rKYmQ3sOoF2NUE/frwgOotOJtvSQPFEgceYALU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(5660300002)(478600001)(15650500001)(36756003)(16526019)(186003)(1076003)(316002)(6486002)(66946007)(956004)(66556008)(26005)(83380400001)(8676002)(8936002)(450100002)(38100700001)(4326008)(52116002)(7696005)(2616005)(2906002)(66476007)(6666004)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5+B4zZ8taqO5loKXPmANSrqqU0Pxl16eZeABOA9txwO9i6xhtY2oARSj/Rex?=
 =?us-ascii?Q?CLgxrMq0k0REN6s/zqL6CXZefvpUItEs6KwrcnQJOVluk84phALnNVzx5sY0?=
 =?us-ascii?Q?ptlTNgjHBLZXNlkJW1HbaV13UPgCvj2uQYg1vpFb86zJfk/87Irfixol8mR0?=
 =?us-ascii?Q?ZNAX3W0vZOmIgvPZvEGMPvDD8MLUEmbBbMxFT7t5MbJWXlEuAKVIjHNrvVSO?=
 =?us-ascii?Q?n3UHemAxZUliUUl+9azDGemgz3+RSnA4SbbcbthnouySnL1yrtUHkCsmWHPy?=
 =?us-ascii?Q?pJFEjdlkWUTD0LP7K8QLnaXtsL7jYDKHTDji5pvStbdRuKZWb5DD31XiclGb?=
 =?us-ascii?Q?vPfy7iNL1oT+2069VZLSjQ0H7L2gCNloW85xfpVjK291cjSSOr/Pd04apR9Z?=
 =?us-ascii?Q?cZWcmWWfqNnQf1d9iqb3tFxItQdRYPnigfhy6Nc33f/B5tMMuChEzC/jpnCq?=
 =?us-ascii?Q?JOsIQt9n/chr5FjjqEEWOR9JSv/nVT1diYeWr4bom8aJNDpZ10SFsDb/RWD7?=
 =?us-ascii?Q?8jCO1+v5bD+2O5KZ6ZkS7bB6SJoR8QNb/X3EzwVzAWlDOiFjIGNeusU22NRM?=
 =?us-ascii?Q?Ey7+5buoLKqc1qN9ul+juzy/GX5RXXtOaqHCJXiQ4z1cs602GypjUnd+VkfC?=
 =?us-ascii?Q?0u3fsfG2cpUVXBvFK+Z4YeT6y/Doymt0zY6Bz8oYF34o7ZkItbQZl5Jig8VP?=
 =?us-ascii?Q?+lDwv1HtKEXfNNhOzuZp667GzHc4Bpb/L36ma18cFItVcm21FarihG6h1Tu9?=
 =?us-ascii?Q?tunRCnSjlshZa+CGR3QEuOs13+gP6Zfu42brzeU1XZrdjHkP5A7whydhKRmT?=
 =?us-ascii?Q?Jw5HtbAtiJQLWTruLrzsR7BuEE6TUFGW17xkT6vzwqaOZz8qebfJDin6nmBy?=
 =?us-ascii?Q?ObuIPMNueglFnYwrwqnC1iZMzSdiwWr+/+ketquhQJJ4bPYvEAHTgzGODyD0?=
 =?us-ascii?Q?uKjARHZlxEhstuSq1SiCnFP3ZVPWu1vLd6rXfij93oVKYz5YXbl1WbmGpK1h?=
 =?us-ascii?Q?Ja3nsAqHIQdJEt9f1Y0vkOHgh8pmttXrNtTtP7lEKM8225gBlaCVdk/sBW4E?=
 =?us-ascii?Q?w3uDQrHcrnguG/059t/0iAIp2ke+Q5fH5I5CCfwJDKo+v6ewznxjqTLj0g0W?=
 =?us-ascii?Q?4NGvJ+odbukMCJbc110vJKAnBHyUNSfcvDPRtChISrDQLvxSH8WU//EqGalI?=
 =?us-ascii?Q?M74IimH4b+WXob79SBSuq5Mp4LHZ76EvSZjPN/9Acv8dCyk3uyIkk+TU11PK?=
 =?us-ascii?Q?F10Q9kE/aHZidDcIfzVOsZRlDHLY/9w+f/htwNJD1Q/6K9cEFAyXOrCl3TM7?=
 =?us-ascii?Q?aU0GYSkU30/YjPkXNATgaMWS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0787e521-8e27-428b-f259-08d8f4c5ce51
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:22:48.4786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mG4d01J0jfml9Bv3b2TxHVaxGp1IDocXkmW+BWS1XgQeGobTxpdfLkWsiDljRlbT45Rj0tfhcs3Dl9tJ59srFQ==
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

From: Philip Yang <Philip.Yang@amd.com>

Use HMM to get system memory pages address, which will be used to
map to GPUs or migrate to vram.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 116 ++++++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h |  18 +++++
 2 files changed, 133 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index de62265adeaa..c6a9766b97a6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -28,6 +28,15 @@
 #include "kfd_priv.h"
 #include "kfd_svm.h"
 
+static bool
+svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
+				    const struct mmu_notifier_range *range,
+				    unsigned long cur_seq);
+
+static const struct mmu_interval_notifier_ops svm_range_mn_ops = {
+	.invalidate = svm_range_cpu_invalidate_pagetables,
+};
+
 /**
  * svm_range_unlink - unlink svm_range from lists and interval tree
  * @prange: svm range structure to be removed
@@ -46,6 +55,18 @@ static void svm_range_unlink(struct svm_range *prange)
 		interval_tree_remove(&prange->it_node, &prange->svms->objects);
 }
 
+static void
+svm_range_add_notifier_locked(struct mm_struct *mm, struct svm_range *prange)
+{
+	pr_debug("svms 0x%p prange 0x%p [0x%lx 0x%lx]\n", prange->svms,
+		 prange, prange->start, prange->last);
+
+	mmu_interval_notifier_insert_locked(&prange->notifier, mm,
+				     prange->start << PAGE_SHIFT,
+				     prange->npages << PAGE_SHIFT,
+				     &svm_range_mn_ops);
+}
+
 /**
  * svm_range_add_to_svms - add svm range to svms
  * @prange: svm range structure to be added
@@ -65,11 +86,24 @@ static void svm_range_add_to_svms(struct svm_range *prange)
 	interval_tree_insert(&prange->it_node, &prange->svms->objects);
 }
 
+static void svm_range_remove_notifier(struct svm_range *prange)
+{
+	pr_debug("remove notifier svms 0x%p prange 0x%p [0x%lx 0x%lx]\n",
+		 prange->svms, prange,
+		 prange->notifier.interval_tree.start >> PAGE_SHIFT,
+		 prange->notifier.interval_tree.last >> PAGE_SHIFT);
+
+	if (prange->notifier.interval_tree.start != 0 &&
+	    prange->notifier.interval_tree.last != 0)
+		mmu_interval_notifier_remove(&prange->notifier);
+}
+
 static void svm_range_free(struct svm_range *prange)
 {
 	pr_debug("svms 0x%p prange 0x%p [0x%lx 0x%lx]\n", prange->svms, prange,
 		 prange->start, prange->last);
 
+	mutex_destroy(&prange->lock);
 	kfree(prange);
 }
 
@@ -102,6 +136,7 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
 	INIT_LIST_HEAD(&prange->update_list);
 	INIT_LIST_HEAD(&prange->remove_list);
 	INIT_LIST_HEAD(&prange->insert_list);
+	mutex_init(&prange->lock);
 	svm_range_set_default_attributes(&prange->preferred_loc,
 					 &prange->prefetch_loc,
 					 &prange->granularity, &prange->flags);
@@ -377,6 +412,65 @@ svm_range_split_head(struct svm_range *prange, struct svm_range *new,
 	return r;
 }
 
+/*
+ * Validation+GPU mapping with concurrent invalidation (MMU notifiers)
+ *
+ * To prevent concurrent destruction or change of range attributes, the
+ * svm_read_lock must be held. The caller must not hold the svm_write_lock
+ * because that would block concurrent evictions and lead to deadlocks. To
+ * serialize concurrent migrations or validations of the same range, the
+ * prange->migrate_mutex must be held.
+ *
+ * For VRAM ranges, the SVM BO must be allocated and valid (protected by its
+ * eviction fence.
+ *
+ * The following sequence ensures race-free validation and GPU mapping:
+ *
+ * 1. Reserve page table (and SVM BO if range is in VRAM)
+ * 2. hmm_range_fault to get page addresses (if system memory)
+ * 3. DMA-map pages (if system memory)
+ * 4-a. Take notifier lock
+ * 4-b. Check that pages still valid (mmu_interval_read_retry)
+ * 4-c. Check that the range was not split or otherwise invalidated
+ * 4-d. Update GPU page table
+ * 4.e. Release notifier lock
+ * 5. Release page table (and SVM BO) reservation
+ */
+static int svm_range_validate_and_map(struct mm_struct *mm,
+				      struct svm_range *prange,
+				      uint32_t gpuidx, bool intr, bool wait)
+{
+	struct hmm_range *hmm_range;
+	int r = 0;
+
+	if (!prange->actual_loc) {
+		r = amdgpu_hmm_range_get_pages(&prange->notifier, mm, NULL,
+					       prange->start << PAGE_SHIFT,
+					       prange->npages, &hmm_range,
+					       false, true);
+		if (r) {
+			pr_debug("failed %d to get svm range pages\n", r);
+			goto unreserve_out;
+		}
+	}
+
+	svm_range_lock(prange);
+	if (!prange->actual_loc) {
+		if (amdgpu_hmm_range_get_pages_done(hmm_range)) {
+			r = -EAGAIN;
+			goto unlock_out;
+		}
+	}
+
+	/* TODO: map to GPU */
+
+unlock_out:
+	svm_range_unlock(prange);
+unreserve_out:
+
+	return r;
+}
+
 struct svm_range *svm_range_clone(struct svm_range *old)
 {
 	struct svm_range *new;
@@ -517,6 +611,18 @@ svm_range_handle_overlap(struct svm_range_list *svms, struct svm_range *new,
 	return r;
 }
 
+/**
+ * svm_range_cpu_invalidate_pagetables - interval notifier callback
+ *
+ */
+static bool
+svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
+				    const struct mmu_notifier_range *range,
+				    unsigned long cur_seq)
+{
+	return true;
+}
+
 void svm_range_list_fini(struct kfd_process *p)
 {
 	mutex_destroy(&p->svms.lock);
@@ -670,6 +776,7 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 	/* Apply changes as a transaction */
 	list_for_each_entry_safe(prange, next, &insert_list, insert_list) {
 		svm_range_add_to_svms(prange);
+		svm_range_add_notifier_locked(mm, prange);
 	}
 	list_for_each_entry(prange, &update_list, update_list) {
 		svm_range_apply_attrs(p, prange, nattr, attrs);
@@ -681,6 +788,7 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 			 prange->svms, prange, prange->start,
 			 prange->last);
 		svm_range_unlink(prange);
+		svm_range_remove_notifier(prange);
 		svm_range_free(prange);
 	}
 
@@ -691,7 +799,13 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 	 * case because the rollback wouldn't be guaranteed to work either.
 	 */
 	list_for_each_entry(prange, &update_list, update_list) {
-		/* TODO */
+		r = svm_range_validate_and_map(mm, prange, MAX_GPU_INSTANCE,
+					       true, true);
+		if (r) {
+			pr_debug("failed %d to map 0x%lx to gpus\n", r,
+				 prange->start);
+			break;
+		}
 	}
 
 	svm_range_debug_dump(svms);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index bdafbc950e93..f77a27a9fb27 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -45,11 +45,14 @@
  * @remove_list:link list node used to add to remove list
  * @insert_list:link list node used to add to insert list
  * @npages:     number of pages
+ * @lock:       protect prange start, last, child_list, svm_bo_list
+ * @saved_flags:save/restore current PF_MEMALLOC flags
  * @flags:      flags defined as KFD_IOCTL_SVM_FLAG_*
  * @perferred_loc: perferred location, 0 for CPU, or GPU id
  * @perfetch_loc: last prefetch location, 0 for CPU, or GPU id
  * @actual_loc: the actual location, 0 for CPU, or GPU id
  * @granularity:migration granularity, log2 num pages
+ * @notifier:   register mmu interval notifier
  * @bitmap_access: index bitmap of GPUs which can access the range
  * @bitmap_aip: index bitmap of GPUs which can access the range in place
  *
@@ -67,15 +70,30 @@ struct svm_range {
 	struct list_head		remove_list;
 	struct list_head		insert_list;
 	uint64_t			npages;
+	struct mutex                    lock;
+	unsigned int                    saved_flags;
 	uint32_t			flags;
 	uint32_t			preferred_loc;
 	uint32_t			prefetch_loc;
 	uint32_t			actual_loc;
 	uint8_t				granularity;
+	struct mmu_interval_notifier	notifier;
 	DECLARE_BITMAP(bitmap_access, MAX_GPU_INSTANCE);
 	DECLARE_BITMAP(bitmap_aip, MAX_GPU_INSTANCE);
 };
 
+static inline void svm_range_lock(struct svm_range *prange)
+{
+	mutex_lock(&prange->lock);
+	prange->saved_flags = memalloc_noreclaim_save();
+
+}
+static inline void svm_range_unlock(struct svm_range *prange)
+{
+	memalloc_noreclaim_restore(prange->saved_flags);
+	mutex_unlock(&prange->lock);
+}
+
 int svm_range_list_init(struct kfd_process *p);
 void svm_range_list_fini(struct kfd_process *p);
 int svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
