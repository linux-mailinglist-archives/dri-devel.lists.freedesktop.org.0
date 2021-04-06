Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE540354A65
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DAC6E207;
	Tue,  6 Apr 2021 01:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0DA6E1F5;
 Tue,  6 Apr 2021 01:46:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A6KvKz90NlROBMZQ6ODb6tNGLFAuk1E7/BrxjW4KOHHhEHtPE0HkDOOMfpnxsGnrgLrVytAepkYWEXwTleNIVcbwZ0K9hjVMoahPdc5zPWy7xWLu1Ci/Xy5a7dh6hTHOU9Q7RN/QjQEZSwDAhdMcq/E5RN7toHg+odIOzxRUXYMfFDQxOpEsltqeSfP0YUKX1CbJ7vwRtvNlQtfEe+52JgGyX4lWAiBbQlu2odqL/4h5s7Ba3Br4wS62D/JxVbLr9wEFnn9rOdHORns5+HtphhLtIL7K01c3jcbohG/1zOh8gtCQIgcFv0FEivcTMEKKh/uYNayBDNQ+cazYcOFYaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXvaiO7oOkfYWimPiKP6Li3sUKBaMxT2BZABFPsQKQU=;
 b=LFt9AqmFGsHMDfV6MfhOOTlQka/c49QV6TaA3ehSdYE40TmygcLweYtFSPcGtucVceMFaPd7Vrf1vPf5qbGXmOhnhVVuznMoVLtTKskxP9JEkTQgsfSWZvXOesOvE+7tz3/I65WZO+iB5LGieewctGYOnGw28fmJ8b6AIQ/h2p7ePoWY+X045UeUJUE9O052ZiOvSRlxB87rItV6/M/NRM1ShZ4Hsa0MhaOMEU2z+r3Gz6Iil04Dam/uUMIPGIn8l6R517c0CemeGrNG9X12weg9qgejoJHx9T+UfFbrhtxz/ro6EbjT/6LAIPXAYIRfVN4ST7kntfliaH1L9vnezg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXvaiO7oOkfYWimPiKP6Li3sUKBaMxT2BZABFPsQKQU=;
 b=KwKrWNO55BSW94C1WJeR3bfo5aXliovNk14n5xJ/P5BYsTf8nBZ3HJCA6bPd/tkxPrpB3YS3bD4UDgzh1XYSX+SsKy8uZJwffd6nhjM6BhqU/hihQgJBV8U8ihIZ7EM2poMbS85NDuo+oi3dPcTCIHtgwHlimpP6X7XefcE0oGY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3773.namprd12.prod.outlook.com (2603:10b6:208:164::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 01:46:57 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:46:57 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 07/34] drm/amdkfd: validate svm range system memory
Date: Mon,  5 Apr 2021 21:46:02 -0400
Message-Id: <20210406014629.25141-8-Felix.Kuehling@amd.com>
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
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:46:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04137df7-ebf0-4cfa-23c2-08d8f89ddca0
X-MS-TrafficTypeDiagnostic: MN2PR12MB3773:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB37731836185499709BFD306D92769@MN2PR12MB3773.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +BASmicsRSSpGiF/bGFocJ0SRYeQ3KMMRnaFSE8RwmBx5OcJD5o0TWvUtK/Wuz1fe1suGWf7RZRUyU9/keD1q0BfnSGDZYMdbdG3xNJzDwXfAgw/qFu4M0kMkWjI4mU3efIDRGsggMk6Ug95Oe5cWg3HzHGjFgg1TEvZTlGaSoJqwLsdr51cuMGrHowDxT1Tn3ovBDi2vp1fCxtqycGDzQDykescT5IxI0wPVNWEpR/uDM84IXU1G66iStXX6aKQUQYU3eCsJutprmH6obkbnMosOmlbU7T3Hca0HbSERlOEhnzI0F0c3UKfxTVKa84whNKG+lcEBpPLCtoiPLznnVmMbhDAcyDjRGBkvtGAmqwZdVLuqXTAKt6XxfHn5pROn2oMdfq1BcSvyS+jqVMUwdH+weWg5MoY8GR1YVq9x5jU6pYMJ6xzTtFoCaE8xD+dCjoBkL6ELXb9NmufCASsnhKTarcxvcSJ5stcdHK/xaTFhUvle8/Lf5Ka0quglVI/pHye8X/H/QFzI/65bt6Vn/UE6NsMvu9UQF9qpRui+VNNNclMoTUpKSf6aeDBfiODgrg8Gc6l+Tg0nc9FZBpW1QqKJ3SotavFNfyGA/XPdT7lGLI/iV31ZjvrP+oe//wzGdLuJ7GBikttKoSFqPwlYLI4Me60Ya+2q+Q3JtNFdOtNXvUu9+76GmyaujxyAxCF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(478600001)(5660300002)(6486002)(15650500001)(316002)(52116002)(66946007)(1076003)(36756003)(2906002)(16526019)(186003)(26005)(450100002)(8676002)(8936002)(86362001)(66556008)(66476007)(4326008)(956004)(2616005)(38100700001)(83380400001)(6666004)(7696005)(38350700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YL7wYDSsv2Bgw9Wf0dlyxN5po7CXqE9FdabTKcYZ7tp9QvB28SWJIYIbitfu?=
 =?us-ascii?Q?K/cw7V90pfz5GrhypFnJaeWbcHTPjbvkjiKfdbvEE4rs54O5Hv37dke5X0Vj?=
 =?us-ascii?Q?9nC09m6qPxL3d1Ka6AvvM4uiJ2LTXMhOsVI8177rS38jyd0rPNTVnF8C5YDz?=
 =?us-ascii?Q?ViQtQuNY+xHSwKzf1lQ9X7HTMdL2OyrNgt/snpdu/C1ROq15PMp8wn5svUnz?=
 =?us-ascii?Q?GhmXjH3SejqqjQebbnL4+LEZNulAO7mmLDfMumJ2Vi6bR86+tGG3Zf2WSEzl?=
 =?us-ascii?Q?SVBHaitozh0OAWUQlug/zCTockbtuMJq7nmjclCf3aS4gf++KDv9AU/WGLdq?=
 =?us-ascii?Q?RgA6UH8gBxzo343luLc51zLnEPqkYYApBOiRLeUAS4kzzSQL7UUClw+mw982?=
 =?us-ascii?Q?hDURTEN1QhtaE57GJQe+e2/4eZ2mSPBdjjaA5IQvDWEfBLFSuQOoRLtvDVI4?=
 =?us-ascii?Q?ABVbhp7cBldT4bwunIiVK1Wsy+Z7e0EwQolKdHV/Gqm4Txc5EAN55GQGo592?=
 =?us-ascii?Q?Wu9iYDPhibwSVEf5cMbpGXe2CMXPjDnFevPGdomxb1oLPaAnGslmyPLGE3vu?=
 =?us-ascii?Q?rCkERPE34Ec33ZRdhrry7TO87Mo5lRJEEUcReZFtXycX/eYDuhZc8uhjvBot?=
 =?us-ascii?Q?uqW6YFWkWlyYETSuEx1zz+J+a/MCmmyq59Rr7ooq0RHc32o4k5UF0TF04+WN?=
 =?us-ascii?Q?6Lld93HcuD1t6awy4wkyx9GrLw1uwJgQs8u5DLz515Jh3MCM8gCnGqkOnyuT?=
 =?us-ascii?Q?ljI6ICrCCfsGQFMSF6lYAOztXtO/0/6eXXFawlSFoI9V8k7wAtaBu2fuUQE/?=
 =?us-ascii?Q?5+L6zrLTVUGkc78FjZ76iDW96tG67/geR0Hqsy7hUyJSE0/5odHE6md0C1ZY?=
 =?us-ascii?Q?3CkTA07mW58fZc6d9DA2bxPcZH6pz1yPqOPDG7A+CdifV5izzZbRAc+0yq17?=
 =?us-ascii?Q?SWjsFsHq0oFegOySxi+6Ck5ANWkTzE9SLPbxDq8d9gWCW4Jfp/mtAW3z6LV4?=
 =?us-ascii?Q?ZALixPulOeOdNrGrYN/AvjBAj3P1U7dgk45ohC2fBntx5UV6Dd53Cmq7ABS1?=
 =?us-ascii?Q?E7iJ8o0Ky2LsLODutDFCiX2mqFycHKCqiCd8N1uXmEUrdRNzSGEIxKLNzasO?=
 =?us-ascii?Q?OzvVL5VoMGVfocYwdQ+zL8fRV5DFHnRLxxWBSSvadk061iQoTbpNvvS6KC9u?=
 =?us-ascii?Q?8qusjYiy8V8cytuHT81Ox1LVcCXa3uLWiJusRZrDfbld2SNlprRZ6VDAGF2G?=
 =?us-ascii?Q?NNtDAX8hB63ILMBuPFzNNWhxm6lwZsar09Rx1LPjuckLFnouWmtlyUJ7J2R0?=
 =?us-ascii?Q?jR1vY9o5AOhpYQJqk1BwTAJP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04137df7-ebf0-4cfa-23c2-08d8f89ddca0
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:46:57.0141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdemEFCn/HV3V4yrHDsoN54Dkf3iENE1UqDljbHpCCru01i47ie8gVRR6huQhggw+4QmD41okaM6WKXANcfHTA==
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
index 1d99f2f0cb31..9cdc030fe5c8 100644
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
 static struct svm_range *svm_range_clone(struct svm_range *old)
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
