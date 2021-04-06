Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28642354A5B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD806E20F;
	Tue,  6 Apr 2021 01:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6166E1D6;
 Tue,  6 Apr 2021 01:46:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rf+P2VWOIv295UUnI+Ofl8IitZO1rCyNqaqdNwvUaaieqnL8rYqVErjq4NnKyXBknH6wg4ubrgrUOPUeIeLZnomh3eBgmvO5vf0JAXz8ZXReInXs8vCEw51nTT5xVSORGXyHX5zhGkm8vlAqKZRsplVVa2PXosHZYEpJUM5aXI5EIN09CJ3TM2zbNcLB2jejmMOcbNV8pmCase5AISO+nGtiHtaIc4kAkdEdGWD0TekafzlyBkSZ79mu6fnXnxvwFjLg/M16Hi9shItqzvkjdA7Bt/lALiRXq0VsP+yt4+RXEPmSz+KqFupnAKXkcAdVh49eTXfcFVqFdQkougkPcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/tb9nkWae1q7/h1tCf0L9o9h8EzyTZc68XjhLNRCcY=;
 b=JKauYvfWJRcBR0vq2Y5mPeAu215c+tIGxNftBVyMxIdpgetTKIhHBXDKQPG/zWFfMixwAZj5aVlRSCy+7oGfpzjFNq+HZehhzYWLuYIsswyJZYGhIeABnbUKCqL1fLy/U7rMHdxWdQVdg8fkTzkOWl0XUxiGSd3PdtOaw9kRkqtV+7bVxBMB7vgt+Twuuw8xsqURz+J8ugbHG/G0G8RODqKHNQZEDKLBzXSS63uJcMrt6MfZDjfyiBBJYzyYZYnpDT3A3+hzrx4++S/xVhc8EgU7LWVkX3YiQf+2O4AxuuW0yJYucWMyD5NZbwX9tE7Qchau3jRVDZbkmjRvdDUY+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/tb9nkWae1q7/h1tCf0L9o9h8EzyTZc68XjhLNRCcY=;
 b=FHy0DRbgCN1eNVuEz+mtICR/IHUwApSSkKohKhuNQtRSANbiAo9SSVePkhkbW409oFCg0cTo6uUv88BGgyleySvfb7rYsteDDCiOS2pOuPn2ZhSc5vNl7s3qVcqjqfhBqNj0/QGh2+j2khcFphkdbVuGZ5A7DQs68AoFRx1Y34U=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3773.namprd12.prod.outlook.com (2603:10b6:208:164::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 01:46:56 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:46:56 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 05/34] drm/amdgpu: add common HMM get pages function
Date: Mon,  5 Apr 2021 21:46:00 -0400
Message-Id: <20210406014629.25141-6-Felix.Kuehling@amd.com>
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
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:46:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8304af7-18bb-4e6e-6e56-08d8f89ddbf1
X-MS-TrafficTypeDiagnostic: MN2PR12MB3773:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3773E069B7CBDD3EE318998892769@MN2PR12MB3773.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0CaPWfcVydBcbP0fa7/EWRjZQigSowhT4U1nZis8BUC0uPr/SnfOCJgjutVxe1vO61oCFWiqVlQvLH+d+wJZMWaDpaiKhlZmzhqbKQPA803ndm7P9YuKLkF31Yd07BluFL69yUHKDGzx26liZEZlrf6FJ7F88x5ZpzKVBW5oN9rYWpnCAHGgDVTuxArN0dOdMaDIJFsN2xG0unyUNWt9tyGdUCfB1GjTYm8/zW2lHb4M7kfRsLMIfA2TnuJsBbUTKzWcVrqOesnGVE4QxzA39Tc7tJcmgXVWSIQm1SSCmHwBkSpKi0Jxtz1AdNYiBHYX9C5Dx2Q/RMBMOsRzon6AiakqEuBBRswzL2Pd5tsKw8GY59H+0AovqWaaGSeuMLAZPV+s50a/OL9avSL5PFv81wgkwmkGNu8u2hHeA1R8Xl3/kPhu59OWRo1Cfrz1UXHrn1dt1WrJC0yqoXVrkpa5agTSX/aL+Yxy0WCKyK/otvW666l0Yoq0yXikgGO/1BE6EQ3VK5a01U2SSG/98v0zjOkEhH3h0HwysNn8oxgpYxVn58RHcSVnKPPN7Fhl8uaJWRidBhii9ankxInSiJca07lNX92lhNH4pEyYeU5Kjoh++C6EsvNtW+XB8yIujqVExUHp+btYeV5GHoUmQy+ZdMFLDki2x6YThBnptcNSUVN77ngjQvMqOf8jFzQVBaNL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(478600001)(5660300002)(6486002)(316002)(52116002)(66946007)(1076003)(36756003)(2906002)(16526019)(186003)(26005)(450100002)(8676002)(8936002)(86362001)(66556008)(66476007)(4326008)(956004)(2616005)(38100700001)(83380400001)(6666004)(7696005)(38350700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qVjAeQEtJBxJhp4k+pqM1o/l1PeHuzqvuWnokAe6n77HO5P3ueNRs4QItbPa?=
 =?us-ascii?Q?vlTB2e7xm0poQLvxI6SHKBjGcJS8PE3fxrsVGBWY9/22qu2zrN2dn2sSmMoa?=
 =?us-ascii?Q?iFJlLhzzo096yLdNzgvugVAO3UeLc2R13Lm4ICw7ESa2HSPApSBTiWOT/2yv?=
 =?us-ascii?Q?K17K2tz/9R/JXLaW9gyuUxK1imIiHV7QdonDcmu9BIDhVcIfWIcWS/5/6aX3?=
 =?us-ascii?Q?1V/Aa/yYFEHJ/S6bs/Cwi+pIbuikbG+67/TKV0E5BwM6sDzrie3byVobRXuF?=
 =?us-ascii?Q?XrKjJQFMA6msPxYMPmJ7/1msjKoYOAExekvsyEd8YhYNGETwbX3SDL/pvFnL?=
 =?us-ascii?Q?VTTRQkEX91j4Inpe3wiGApoiJVAJe4kkXsUxLL2pT89Sak9054A8aUEmvaYu?=
 =?us-ascii?Q?AgrzG4zmS1DY94YlinE5wIThoa+gnbJwNatDnIyiIhvznu5oBmLfRPY/YjgV?=
 =?us-ascii?Q?vH4XQ6r8Q3EsEZ9enOvfMCIrzKRxMo4CaLcK1glgsT4csccIbZ5ot7xpOnZW?=
 =?us-ascii?Q?CXmhRc0W4EoMVu4eA6BVY7Hyu8q6PSN7WChYdaYCMAgATZOIMAgagfFGoG8p?=
 =?us-ascii?Q?mwna6iGSPBZvYtUE0+i00XfmTRG04IOglqfd+Vi2nIqu7XihR+8hGcdj2QyL?=
 =?us-ascii?Q?bHkBVMEuolUP1UgiMA0wpHEulR9qNh5ReuY40dryx0rwpGHaHiEWqdPuvt8e?=
 =?us-ascii?Q?5GjNQG5Rj8NRx+fIQtSkcwMed1STnr1vTLkV9HAfY3PVsdSxuwULvqDraJ6n?=
 =?us-ascii?Q?yyWBYIYhfXuon4eXEIPrNZCfQjrtpcMXL3aFNwouWEALECnFRkOtnebC7BvT?=
 =?us-ascii?Q?H1XLWeEdn3qMOSx893iVZjFsikuxhsLEpEFKlztXByMTq1EJ67aoCXRJv6vj?=
 =?us-ascii?Q?syZcJpj7gui5ZaN+3FkYfpb64fkA1drtE83uA7/1Clt/ouf6IZuXAPtDpKrC?=
 =?us-ascii?Q?GW1oihfxMj1RLdKnCUk+OuOUgunGJESxWcSj8o7+yIXt96YRDCQsW67Meeqr?=
 =?us-ascii?Q?q9mkFeZyRs4ifQ6g37TR/IsSr5oz1iM9SuwcVo4I9y9H7a1/iWAXvegb4Q4e?=
 =?us-ascii?Q?qsZ7WM2+nrfZXi8Qhq/T+oN35U+RkluT5v+PAYWEunciTjgZKLQFhKCTcUmm?=
 =?us-ascii?Q?URBzmi4yKVZbkLb2B25q8O+iAyjZghVS3w5EsYgB8PhwEujxskE7kIHBeFOq?=
 =?us-ascii?Q?7LFkRVC7LhFfzUh0at0EKnCEeYKFOo3O7ka4vBabdcXanOJXBnX7LXVALajn?=
 =?us-ascii?Q?3Ql+2V2YFotmrJWxA5l87wCPYNLm0QrmpACrrwQwbcLws5abqXTWh0A1/7Wg?=
 =?us-ascii?Q?3RCA9EnF77OgkiaU/AyPtJ24?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8304af7-18bb-4e6e-6e56-08d8f89ddbf1
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:46:55.8363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xmWMN22NLKt95tDYNtPMXkBSbRgEPV+/aFf89+evSjCwZL2HVELHj55YyNHUYYyDT85Du0hR2g9va2L5XlGVtA==
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

Move the HMM get pages function from amdgpu_ttm and to amdgpu_mn. This
common function will be used by new svm APIs.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
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
index 74e4fdcf78cd..3370c1a06bc2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -32,7 +32,6 @@
 
 #include <linux/dma-mapping.h>
 #include <linux/iommu.h>
-#include <linux/hmm.h>
 #include <linux/pagemap.h>
 #include <linux/sched/task.h>
 #include <linux/sched/mm.h>
@@ -670,10 +669,8 @@ int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **pages)
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
@@ -689,76 +686,26 @@ int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **pages)
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
 
@@ -787,10 +734,7 @@ bool amdgpu_ttm_tt_get_user_pages_done(struct ttm_tt *ttm)
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
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
