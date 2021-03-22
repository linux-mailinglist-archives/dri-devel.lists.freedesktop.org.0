Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E30D343EF0
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:07:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B1689EA9;
	Mon, 22 Mar 2021 11:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2258089BAE;
 Mon, 22 Mar 2021 11:07:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STJ9YiH+7yisbmCUdJ03oRJzoygwH47upaZDAOq6xLsVNGE2Tj8hFrHyJ3jwKh3lv1yACw5vrJxknQsXyT/9/3iq4iwT7zJnqcEzeaem7DkQwecWGfA4XvaK1INjLibo7AiYM87utI0pyM/S+oBNAjeBdi+mRToyevssMGwa84yngHO+oD86+nIVSuvMSUfmZ3GpijfTEqqrCJgdkx9K+mwOkPITuLW7TByR/HivodFPiEMKuwVof+RPR/YWeIiPiYoXNDSjTHxfoI4e85gNlbpC3WIHmtviTgFf+gzmRtrjajtIet6gLXwX1+Hta+CPHK6BjQGB0npBq0ydQzAtbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4ng/7eaV6wm4SzX/uBpO+zk7VUjtJ+htMsJmamqLQo=;
 b=YfYKuV+J8lu3M2qrcgqarxBHBQ4NfxcFCM344EE+Ob8qv7HAFDW2eIcJ6ErTTRLI3+QvKJzHtPPwYv0/4gRrWeq2DRdHEtOV4/4OUu8PQ3XKLAKlAMHXPYkfEBiln+dOuXf25wesTlCD1z53bp4TQ4HHpWQCkA/shNwUvfFaLoqR4jNQQmgutFkHM6RXZTBubsqSJy8vVm1KD4Pj3A0Vu5gdj0smBAXXohsQRZVFfimzaNjopkgOO2Qjhz/h3QpfzSxd444m4gFAJHUMRt7hW6k4rfmu3bH+13q78dKcmcnEEVg/16kh5aKt8lDBItuHBnzlx1ZW/NXhiDTApsFEZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4ng/7eaV6wm4SzX/uBpO+zk7VUjtJ+htMsJmamqLQo=;
 b=faJtgcZKAVOPaRWin3W8UleihuO7LGG6nN6lPWj0mvcbheVxjKDXy0YvveOWx7zOHpypl2DwnAYZTG8InQEOAiEQthaXqqp5jUdsnqwi14Jw5V7cM68CmJD/Wt90zwjFN5n5i2WNqaEmk8csyoI+NhobqSes5/NSveNUIM7Z6Ow=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3678.namprd12.prod.outlook.com (2603:10b6:208:158::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:33 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:33 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 06/44] drm/amdgpu: add common HMM get pages function
Date: Mon, 22 Mar 2021 06:58:22 -0400
Message-Id: <20210322105900.14068-7-Felix.Kuehling@amd.com>
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
 Transport; Mon, 22 Mar 2021 11:07:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f128e5f4-b81d-4c0f-f328-08d8ed22b0ee
X-MS-TrafficTypeDiagnostic: MN2PR12MB3678:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB36786AE4575B56F68732E89392659@MN2PR12MB3678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q9dwFnBMuBGmidk4MmX9K8wvc7oO/cUIla7QWIHpQcECzP2MIF9qIWBaGxmGkQBGg1EUeeSs/tlsk75b2pKWz3/CgcSfo3uFZk2zEzPUOzcEP0lagm2iAAN87k8QROj2DBujCrWMOMcU4qKh8hKtJw+OPVUqkR1MeKVzQN6eGb5HZmypMkYxyeS04wZL3TCwokPD8DHNhrziq8WR4tumjPSetv4R6hUz+0lA63l7KDnQRwDDDJj8PLr38P4YKIfuV2VXem123W1xymiCyPnIw4PHRgvqqzBa92gBywURNnPRJcQlUFjUS7RiKQU3fr31MT1liy7sjyoprlzQYFwEU9gtxVlnZbHr0nWxFzwtcidKIcwuY0amv5Zv8VzlUDyx2L/wMGWcD1jxVCX/qeG+/Ha0Z4kMAOgqePCa3e+zOTr0NSa7HfD25By/xO1WznAJ9RohMcUizRuXSy8OotvGN3nMoAGbfVVCcrR4kFwQ7qAxu/+gme6M8tj6lQEygO0NZt62W0tOMaenOVXBTRF+/etAxy7w0XoC0wj8JDetv7XrE8WXzUaQXImjh/ZPTaEC2TK4eHeTd0ERW6mn5Etsv/BQ/wHO7QkqdESKhUfolLwqv4LV8PbPYZ91l+sQeBDUIyvgkVbtZ9kNRyU7twzFHp+fao6v0ColHyhhLmQUCi4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(52116002)(7696005)(6486002)(1076003)(36756003)(38100700001)(6666004)(83380400001)(478600001)(2616005)(956004)(4326008)(450100002)(16526019)(2906002)(186003)(26005)(5660300002)(66556008)(66476007)(8936002)(66946007)(316002)(86362001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ASAqsS51eVDEQKY0B9thZCpN6reNQdExliCDF0CYyLfbiC6WgYHSRiuNxLVu?=
 =?us-ascii?Q?0XPh26Fi6ACFmjVYSeuCOkMFTX6gFbl0GtulB5rYsoFgAfhnB0kE1Exqs9De?=
 =?us-ascii?Q?pmI0vAfXSBR94K4KfIFBfYzlbOb4cJLZx1qdrXVYQaWJQEaZpGj9k7QYcB/5?=
 =?us-ascii?Q?/IL4usWCW0qqJ9xTrcoA6P3ERJ9PLVd9Mj14wyg5pfNUzayn0FlSuJ1IMi4Z?=
 =?us-ascii?Q?lPPFghtIDv18dOxdYsXcDy8Ums1pVPY8PMGM1t3Os1UfYy2HlHXqppt3CAoH?=
 =?us-ascii?Q?cqvozRSJZMoMmnOPV9EXCsmNztwgAVq7VP8xT1YZzNNqaV50tSeVrSeVbVw5?=
 =?us-ascii?Q?96MJk7uVT+OEVVbSFV5tbmh3GKbf8mfaOOvs/AKu20XdUcAQsw0WErDKPYxA?=
 =?us-ascii?Q?MlLgC8ty0HuhDGCgiTcAnfvSsBgFva84Zxw/d2DbzQfM++8F/jsGuOmKiTqq?=
 =?us-ascii?Q?3ammwfUmLPlEVfAubunJbD6HoSe1PRB05eUWgdCVpUQUFxKCxlLiaozLKGD7?=
 =?us-ascii?Q?EwrgL4gNM4T4CXLDV5/5JF6CN8vLCexZauQ49BQSKrOuvC299L0La7QbNouC?=
 =?us-ascii?Q?tdLZrj8QR7L5XAK/5zUOgasRZEn3x7+WY/M2pOmjp5wiRvyO1PXOjm1YCy3U?=
 =?us-ascii?Q?CTothZU6rBIH2greE/PJ0LYNGYBry8pIDJze9komW/m5pl/grDDaXGjXL2Ro?=
 =?us-ascii?Q?sLrJ1br/JjZrFTB5chiZcbOS5xl5Mx5njCfSIUOyPAyDktzMZw93CEptWyl4?=
 =?us-ascii?Q?mTcYeEjZkTBAjUkKNUVkRBdeB7Dh9OOmoSV3rFYGwEGaqUoFxOmh0Ov7VG3n?=
 =?us-ascii?Q?Inhk/6Sor3dU7C1SHz+cBgFoDLZncl0ZupaUxCyW23uRA+jXHMzBc84mZlpU?=
 =?us-ascii?Q?5lIexIxHxOamRQUBnJ+i0QH4pTnI0WwaUledZp5q9N+mALD6jI2xk0rCGtgx?=
 =?us-ascii?Q?55fhirSCos4lm7JGRPaIPwa4iOGSp0eaYP/91lzg3C3CgocwoJdEwUtd+yAM?=
 =?us-ascii?Q?gLcxJpJMfH2gINcXnhKyNaKMK99QqoW6bDM+b2sa4RD12TR4ncHXvKA6YEQ+?=
 =?us-ascii?Q?lLN8qMxbzf0dN96bAfncQXImzq6WEv9DDeKosnJZDlSyUvxsea8xQH3C77eK?=
 =?us-ascii?Q?7FhDrVEs49zq4c62SbrgjBdDJWzh+7od2gPLqvsWKcZvUyEhUsk2zY8wvQC+?=
 =?us-ascii?Q?Ygf74XCcBkK36jGMowdCMpTPn0SIkumqTVcQRQRZZDrIvgeAiIF9USWcH2jQ?=
 =?us-ascii?Q?xiBrIE5/rnCDdxW3nxmoL9sJjLtNhaeNRMO71DE+V99tJ1E+/oaSfxxwmk5P?=
 =?us-ascii?Q?vS8FCuzO1wdLNTZ8XprTDmY7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f128e5f4-b81d-4c0f-f328-08d8ed22b0ee
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:32.8465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U9AR5KDzG+eTh4Kiu7GSs0pmSD2BkXUlDQAzTbrp98wSkKhbt4Tj/JOlvkiTtks2Tit0UZrv2tF0iniv2eoeUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3678
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

Move the HMM get pages function from amdgpu_ttm and to amdgpu_mn. This
common function will be used by new svm APIs.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c  | 83 +++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h  |  7 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 76 +++-------------------
 3 files changed, 100 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
index 828b5167ff12..997da4237a10 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
@@ -155,3 +155,86 @@ void amdgpu_mn_unregister(struct amdgpu_bo *bo)
 	mmu_interval_notifier_remove(&bo->notifier);
 	bo->notifier.mm = NULL;
 }
+
+int amdgpu_hmm_range_get_pages(struct mmu_interval_notifier *notifier,
+			       struct mm_struct *mm, struct page **pages,
+			       uint64_t start, uint64_t npages,
+			       struct hmm_range **phmm_range, bool readonly,
+			       bool mmap_locked)
+{
+	struct hmm_range *hmm_range;
+	unsigned long timeout;
+	unsigned long i;
+	unsigned long *pfns;
+	int r = 0;
+
+	hmm_range = kzalloc(sizeof(*hmm_range), GFP_KERNEL);
+	if (unlikely(!hmm_range))
+		return -ENOMEM;
+
+	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
+	if (unlikely(!pfns)) {
+		r = -ENOMEM;
+		goto out_free_range;
+	}
+
+	hmm_range->notifier = notifier;
+	hmm_range->default_flags = HMM_PFN_REQ_FAULT;
+	if (!readonly)
+		hmm_range->default_flags |= HMM_PFN_REQ_WRITE;
+	hmm_range->hmm_pfns = pfns;
+	hmm_range->start = start;
+	hmm_range->end = start + npages * PAGE_SIZE;
+	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+
+retry:
+	hmm_range->notifier_seq = mmu_interval_read_begin(notifier);
+
+	if (likely(!mmap_locked))
+		mmap_read_lock(mm);
+
+	r = hmm_range_fault(hmm_range);
+
+	if (likely(!mmap_locked))
+		mmap_read_unlock(mm);
+	if (unlikely(r)) {
+		/*
+		 * FIXME: This timeout should encompass the retry from
+		 * mmu_interval_read_retry() as well.
+		 */
+		if (r == -EBUSY && !time_after(jiffies, timeout))
+			goto retry;
+		goto out_free_pfns;
+	}
+
+	/*
+	 * Due to default_flags, all pages are HMM_PFN_VALID or
+	 * hmm_range_fault() fails. FIXME: The pages cannot be touched outside
+	 * the notifier_lock, and mmu_interval_read_retry() must be done first.
+	 */
+	for (i = 0; pages && i < npages; i++)
+		pages[i] = hmm_pfn_to_page(pfns[i]);
+
+	*phmm_range = hmm_range;
+
+	return 0;
+
+out_free_pfns:
+	kvfree(pfns);
+out_free_range:
+	kfree(hmm_range);
+
+	return r;
+}
+
+int amdgpu_hmm_range_get_pages_done(struct hmm_range *hmm_range)
+{
+	int r;
+
+	r = mmu_interval_read_retry(hmm_range->notifier,
+				    hmm_range->notifier_seq);
+	kvfree(hmm_range->hmm_pfns);
+	kfree(hmm_range);
+
+	return r;
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h
index a292238f75eb..7f7d37a457c3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h
@@ -30,6 +30,13 @@
 #include <linux/workqueue.h>
 #include <linux/interval_tree.h>
 
+int amdgpu_hmm_range_get_pages(struct mmu_interval_notifier *notifier,
+			       struct mm_struct *mm, struct page **pages,
+			       uint64_t start, uint64_t npages,
+			       struct hmm_range **phmm_range, bool readonly,
+			       bool mmap_locked);
+int amdgpu_hmm_range_get_pages_done(struct hmm_range *hmm_range);
+
 #if defined(CONFIG_HMM_MIRROR)
 int amdgpu_mn_register(struct amdgpu_bo *bo, unsigned long addr);
 void amdgpu_mn_unregister(struct amdgpu_bo *bo);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 2bafbd78ba4b..aca5a29f6d2a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -32,7 +32,6 @@
 
 #include <linux/dma-mapping.h>
 #include <linux/iommu.h>
-#include <linux/hmm.h>
 #include <linux/pagemap.h>
 #include <linux/sched/task.h>
 #include <linux/sched/mm.h>
@@ -692,10 +691,8 @@ int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **pages)
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
 	unsigned long start = gtt->userptr;
 	struct vm_area_struct *vma;
-	struct hmm_range *range;
-	unsigned long timeout;
 	struct mm_struct *mm;
-	unsigned long i;
+	bool readonly;
 	int r = 0;
 
 	mm = bo->notifier.mm;
@@ -711,76 +708,26 @@ int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **pages)
 	if (!mmget_not_zero(mm)) /* Happens during process shutdown */
 		return -ESRCH;
 
-	range = kzalloc(sizeof(*range), GFP_KERNEL);
-	if (unlikely(!range)) {
-		r = -ENOMEM;
-		goto out;
-	}
-	range->notifier = &bo->notifier;
-	range->start = bo->notifier.interval_tree.start;
-	range->end = bo->notifier.interval_tree.last + 1;
-	range->default_flags = HMM_PFN_REQ_FAULT;
-	if (!amdgpu_ttm_tt_is_readonly(ttm))
-		range->default_flags |= HMM_PFN_REQ_WRITE;
-
-	range->hmm_pfns = kvmalloc_array(ttm->num_pages,
-					 sizeof(*range->hmm_pfns), GFP_KERNEL);
-	if (unlikely(!range->hmm_pfns)) {
-		r = -ENOMEM;
-		goto out_free_ranges;
-	}
-
 	mmap_read_lock(mm);
 	vma = find_vma(mm, start);
+	mmap_read_unlock(mm);
 	if (unlikely(!vma || start < vma->vm_start)) {
 		r = -EFAULT;
-		goto out_unlock;
+		goto out_putmm;
 	}
 	if (unlikely((gtt->userflags & AMDGPU_GEM_USERPTR_ANONONLY) &&
 		vma->vm_file)) {
 		r = -EPERM;
-		goto out_unlock;
-	}
-	mmap_read_unlock(mm);
-	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
-
-retry:
-	range->notifier_seq = mmu_interval_read_begin(&bo->notifier);
-
-	mmap_read_lock(mm);
-	r = hmm_range_fault(range);
-	mmap_read_unlock(mm);
-	if (unlikely(r)) {
-		/*
-		 * FIXME: This timeout should encompass the retry from
-		 * mmu_interval_read_retry() as well.
-		 */
-		if (r == -EBUSY && !time_after(jiffies, timeout))
-			goto retry;
-		goto out_free_pfns;
+		goto out_putmm;
 	}
 
-	/*
-	 * Due to default_flags, all pages are HMM_PFN_VALID or
-	 * hmm_range_fault() fails. FIXME: The pages cannot be touched outside
-	 * the notifier_lock, and mmu_interval_read_retry() must be done first.
-	 */
-	for (i = 0; i < ttm->num_pages; i++)
-		pages[i] = hmm_pfn_to_page(range->hmm_pfns[i]);
-
-	gtt->range = range;
+	readonly = amdgpu_ttm_tt_is_readonly(ttm);
+	r = amdgpu_hmm_range_get_pages(&bo->notifier, mm, pages, start,
+				       ttm->num_pages, &gtt->range, readonly,
+				       false);
+out_putmm:
 	mmput(mm);
 
-	return 0;
-
-out_unlock:
-	mmap_read_unlock(mm);
-out_free_pfns:
-	kvfree(range->hmm_pfns);
-out_free_ranges:
-	kfree(range);
-out:
-	mmput(mm);
 	return r;
 }
 
@@ -809,10 +756,7 @@ bool amdgpu_ttm_tt_get_user_pages_done(struct ttm_tt *ttm)
 		 * FIXME: Must always hold notifier_lock for this, and must
 		 * not ignore the return code.
 		 */
-		r = mmu_interval_read_retry(gtt->range->notifier,
-					 gtt->range->notifier_seq);
-		kvfree(gtt->range->hmm_pfns);
-		kfree(gtt->range);
+		r = amdgpu_hmm_range_get_pages_done(gtt->range);
 		gtt->range = NULL;
 	}
 
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
