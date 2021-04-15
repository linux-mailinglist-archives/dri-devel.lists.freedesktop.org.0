Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7553535FF45
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBA16E994;
	Thu, 15 Apr 2021 01:24:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1FE6E98E;
 Thu, 15 Apr 2021 01:24:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGgsXEmty74Sx3QPTrMlsS7rC7SanvBFIDDXQ9ZyUR2G4ndds6hAeG+fdkL+laRkkH/VSPfHUMYxhJv9fKwQzPiIgfZhMRPsNGZ6Qz0pf5qq/ggYeipta7HAEC9Sb2J6orfHi8Vgy/q0Vk7on1Xu0J1OV+93Qv0HPjz3LzFu56AUtk3YCGKvGLY4DAiGz773/QDGojk6CgJ97BAzSADhY+EaqkUO6ySOTuFgVpWRuQ//I13ZUpNjOBd5Q0vB+u1UmPMPWW82zAZb2N82MZ65/+8rzOfCx9ftdMDnEDK67Ob8HNK9bN+3mVOkyvwjLs0k4xEUvVtkVdcmmztcfWdEXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1St6joBetb6bQXfSt05+TidFL1JuwM/FZGWR9S4YWLc=;
 b=ZOVsSl4xI2BnPc1LRR7eNzEyy8ZNUnfKwQuPsKqB8cEyuXZxnU1yMinatEvz58AjK4DMfWZnF1Y4dNCOjkyuCftL65000z3Cv+5qgg6oUk1sLnp0GKaQ2ItSWx0OiNT2COYKV2yMPI1uF/4PcbhgaKlqLcDvW/7gcRDXjMJKhkRg9nBLf0HFP1zfg0ro4I8dRXxa+L3+DHAXlvT3UJMARnwzUan6iwWnmcVrVxwXr4NdyqJjkXlvD0Kb5k+fq+blGTB41G13SCy6UJcSXNCKlod9rIRqTp53kshsT75JsCrDxGkSN+KUVA+e2OmFJdydRXbQ2QF+yT7hBPMlGupfsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1St6joBetb6bQXfSt05+TidFL1JuwM/FZGWR9S4YWLc=;
 b=ito+cvkGAKypLJS55GA7WjmrL8UpCzY6cQaaCGghLUCRCAJGkqJSiOUchM5RpVRp5pK/hynST9mKDv1g+Qc5zPdJSv5GXLy59hgVHzwMkl5xVHjLf7Dt+ljqEtPfPgnZ6REiHLPhVk1beJoMT7W6PXDmFy81yobNxGciV1AZIUY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3839.namprd12.prod.outlook.com (2603:10b6:208:168::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Thu, 15 Apr
 2021 01:23:58 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:23:58 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 07/34] drm/amdkfd: validate svm range system memory
Date: Wed, 14 Apr 2021 21:23:10 -0400
Message-Id: <20210415012337.1755-8-Felix.Kuehling@amd.com>
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
 Transport; Thu, 15 Apr 2021 01:23:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f53148e-df21-4e72-2528-08d8ffad2490
X-MS-TrafficTypeDiagnostic: MN2PR12MB3839:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3839BD009B15674DE6E6BD33924D9@MN2PR12MB3839.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SLFsajKBzzUAqdcJEydS1XFq7Ie8GPGZA2VxGHL85y/fcSKrWq4JcCFgfcylkLsFSrTaCEmnotAdunpwzHmu9feQEfhgbH9+ufqyFbSwcG8ToaA5MUUnZFLAAg7OLnRkVKc0+QejcREozW6eM3s24cuBvx1qddFLXfFRNhyoIGiesUvFK4QzgeNakwkxuZKtl+6N6mcf17AJNsBAynzNhbEeaoQ53+sP088ps0+LodFNZjT4w45Z7eZxVojE0eGRK66QE+FT+D+KlmmLiwUsYj66yE9McmJeRtscwniez0eY7/1u37CP9GmYnofmMf0gicbjp8iprHqctoFVh6Vs8vIdpDnmFKDbJfix+nVPWbeKLdSx8YVK4iK0MU17kYwGtrYHhObRoQDlbqwubkrNb3eBRv71ZZTTTiyI0xz92n4OfHIMfAZle0KUyXwjBXGP6R+RjTrWPgWKB2z7VGsT4gmT3rvyHxmzyOXk9Dd7eIamD9MjD8gK1PiADZZf+DC/H5GsnFm7ikxUwykFhaYYo/MfFGGTXYzHEOOZlnC/MFKX1IrnZOpP+HnUUkMrH21zAnOmKIvqP4aHnw51iGG9UbQf4VwSgZqk0qPszmvjjeac/58XJtLl4zdEkzRduW5PCvCw87Ht+8jp0CsvfvP6IBaDToDMla+evfsOYFYSXE4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(2616005)(86362001)(26005)(956004)(52116002)(8676002)(316002)(83380400001)(4326008)(5660300002)(38100700002)(38350700002)(6666004)(478600001)(450100002)(15650500001)(8936002)(7696005)(66476007)(6486002)(66556008)(36756003)(66946007)(2906002)(1076003)(16526019)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?kNbF0U8CzjAdSHR7cUxl4KxaCYhLLbing5ALT32QRaWWAps5CqnEJV13lgiS?=
 =?us-ascii?Q?fyL/ErPiw+Lwo+1Kv3agixFPw5hL3W6+diG1BMlz4BhI3mWaNtNeknZlqgnU?=
 =?us-ascii?Q?F44w/OV8YNNcKUNW5EE1kPN+DGdXEnZRN6Z3cBZO3njtud6hCVj1DjvzPtUJ?=
 =?us-ascii?Q?0wwcIrp8yeZ4r4o2UOkhkjYYZicoChKTNlAjepUTNg5smfU+iBN5OFlCnkmY?=
 =?us-ascii?Q?ACm+TMGxMdk7+AeLNL50ekZ+3C2thzMoAaLrn3HGM9o0bMmTz1dZJfqlbgpU?=
 =?us-ascii?Q?QPpZpaXZTpq9+NwtxnWZ6ZnvitdvBX/G2sMIuQTKBx23wXdmbzP3U6+kQ3v1?=
 =?us-ascii?Q?2GgoxKYZU7okHNtxrKM3kA3V0G8JWt8D7V2o/9G3NRDc15ub7s+tNLJMTX28?=
 =?us-ascii?Q?/bJCEtkDOnlMt+jVKNY4gIFvAeT+SZeFmOxDgHvv8l9sZywzzpxYgv0FS5Eo?=
 =?us-ascii?Q?FPYQDxd/15fnqxU1lyNqv5VW9l2327+T0/c4QRO4byyIRXIjyg+WeH/fqDDQ?=
 =?us-ascii?Q?qM9eJ0Bbi76SbrMWgI5Cd/GPCfhSacRVGWYDolxuS01YJuMmzrZJsdWUTk/1?=
 =?us-ascii?Q?LqmCd6bKR9PwLidlpG6e4/mZt2eReXf7GoGWYjiXsRPqw2tVL40h5zaWt00a?=
 =?us-ascii?Q?IBu63e/7AFrxPc+aX+6PUU2oSxpIq2fZArz7n8oGqBQNYa9Nhc5ENCHK0B7I?=
 =?us-ascii?Q?Gu8V4s79HoXD1EgFY1iTQRwLXmr2zHSWy1lu/RC/oH4F3CjN4+7uQcSVjOys?=
 =?us-ascii?Q?XjbbJw/MPVM1IrUZKHGzq9p9xIzQlZt6Bo4llpWW2MBIqI3GPo2rjpFJtSm6?=
 =?us-ascii?Q?MhlHHRAlXerdqg+xk0WhNLuHlXd1O5QGK5xolSFR69o7WBe/FzENFBnCYn2R?=
 =?us-ascii?Q?iPVYg/nWSGFfOYOLq80cki0Dv8OaHpT5BiqvRoffMEl+m470DmzhwYg4+ZVW?=
 =?us-ascii?Q?rON/kk37A94Z1fBPyKx/6S2mvc9TRGaBd9kvvaIf+VgeeQtSR8DBAfUSXXsM?=
 =?us-ascii?Q?9fLBHQ5VnEwIWVCNlTCYb5SszmjLILmwrwqHzm5aawn98PuLnpIRLjJChEKY?=
 =?us-ascii?Q?/PGUYr5h3qxug1e/QDO/vYeJyPFYch1YIhaAPWn4X+XuHvoIrJASiMuCah0Q?=
 =?us-ascii?Q?M+PnadLUbfZ157ksdyIXyHG34Uy2ln/A7/cZxcCoauru2XpAiOjuq9KVaT6m?=
 =?us-ascii?Q?sl983vUkOc3uCkyZPQqKx4teoo+QqMmgOXAttrlfPRrgqwNWqvicu5e3EPKW?=
 =?us-ascii?Q?FDC2PEq54Io0oSLZ38oTeM/5T6UyO2+qrL/T14Nz9WYeZRD3kQukS4zEXtR2?=
 =?us-ascii?Q?zwbUIzDK1zuIYGWISdYrqUvS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f53148e-df21-4e72-2528-08d8ffad2490
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:23:58.2728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJkz8gracFlBEq+MG8sdZ1TVFy7+9R51YbMkgz9tU1fIgMZVUJqU6/O48wbMsk+jagFwfhM886+T3r4dB+YivA==
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
Cc: Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

Use HMM to get system memory pages address, which will be used to
map to GPUs or migrate to vram.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 116 ++++++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h |  18 +++++
 2 files changed, 133 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 8f147fa4ff94..db72b767b958 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -29,6 +29,15 @@
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
@@ -47,6 +56,18 @@ static void svm_range_unlink(struct svm_range *prange)
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
@@ -66,11 +87,24 @@ static void svm_range_add_to_svms(struct svm_range *prange)
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
 
@@ -103,6 +137,7 @@ svm_range *svm_range_new(struct svm_range_list *svms, uint64_t start,
 	INIT_LIST_HEAD(&prange->update_list);
 	INIT_LIST_HEAD(&prange->remove_list);
 	INIT_LIST_HEAD(&prange->insert_list);
+	mutex_init(&prange->lock);
 	svm_range_set_default_attributes(&prange->preferred_loc,
 					 &prange->prefetch_loc,
 					 &prange->granularity, &prange->flags);
@@ -376,6 +411,65 @@ svm_range_split_head(struct svm_range *prange, struct svm_range *new,
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
 static struct svm_range *svm_range_clone(struct svm_range *old)
 {
 	struct svm_range *new;
@@ -516,6 +610,18 @@ svm_range_handle_overlap(struct svm_range_list *svms, struct svm_range *new,
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
@@ -669,6 +775,7 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 	/* Apply changes as a transaction */
 	list_for_each_entry_safe(prange, next, &insert_list, insert_list) {
 		svm_range_add_to_svms(prange);
+		svm_range_add_notifier_locked(mm, prange);
 	}
 	list_for_each_entry(prange, &update_list, update_list) {
 		svm_range_apply_attrs(p, prange, nattr, attrs);
@@ -680,6 +787,7 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
 			 prange->svms, prange, prange->start,
 			 prange->last);
 		svm_range_unlink(prange);
+		svm_range_remove_notifier(prange);
 		svm_range_free(prange);
 	}
 
@@ -690,7 +798,13 @@ svm_range_set_attr(struct kfd_process *p, uint64_t start, uint64_t size,
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
index 537101dd19a6..10c73348c2c0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -46,11 +46,14 @@
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
@@ -68,15 +71,30 @@ struct svm_range {
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
