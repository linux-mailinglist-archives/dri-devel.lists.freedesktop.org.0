Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CBB35FF83
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3806E9DB;
	Thu, 15 Apr 2021 01:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680047.outbound.protection.outlook.com [40.107.68.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823406E9B9;
 Thu, 15 Apr 2021 01:24:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jaMdv+pgoNtbiAYvuBpgg0ron8i06zng7hHbVops+Qis65ohvwXB0/NyeospNgLImG2wy/e2MQ9XnCp4f4uH1qXUCQ+EX89dxLE5pXb4frzho2EYa4x6gIxjo1vFQxFN4HDg6o8EYKptMdQuz4uV71adIbUdNQcYD4o6qbSnTTFixITpzLIpr34kaleGrYegpy9e2YRVCWv1FS7ESPZY5HH2ZLDP7vTwhdGabWmCAVh2QBg0p5NJebHQE5knVSS5uFrB94rvmt8FHI0NglMIFSZhRXP9PPW7k+29ZpsZ3GtmHDnB8cWxz/6QyAsdxcyihTqs6a8SHu2RSPdZbc5wJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SbmbnAtLBTXTuyXg8HKqkxZh43j4L9aAdf2EWlQ/eUg=;
 b=LQhQVy9QlLs/Fr3iyXBIq72FZXz/sP4haXLCHPVAYn+Hh7j0ivJHuwXMnq1nwlcOarMZAnFLkpHJceDNFALadyqb6p/TqnuWDhNp+WtFiyoWJBqe27GaEh3yDWHnb8ULhiook5rbvhjP0kyr6I/oAfKZwnISMhpgyQeBxVA0tHHpFDN+BmLH82ngTNDOrkEPHgey40X7PtfRbzQrQixkihN9SyEWAdIPc8ZdQ9/Oz8d3VfZEzkW7GL3B8x4ugAx0BFmO+j1OyeWbHOQjVYCl18khIBzVFhWKQO9LCl6SRgKWWuy3T/+cTHy5LbFik4U8Zfc5tTv1X9IYpotFeO9ghQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SbmbnAtLBTXTuyXg8HKqkxZh43j4L9aAdf2EWlQ/eUg=;
 b=InbzCt0kTtedAxYekamaO0tE16wr7wHzE7tT48RktzHgZz3q+3Ck+LhLfCAqNrDSA5TAUTRE5Dr1Juy/LHeWNQ0nj9/TLvAHRHKT7l3yIUy2+/djbLThDxDfIR7g3BmRoJxRO51ab9eG8Sa30OUdQjaE7qFa3YFaShvhYz5XLgw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4797.namprd12.prod.outlook.com (2603:10b6:208:a4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Thu, 15 Apr
 2021 01:24:40 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:24:40 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 32/34] drm/amdkfd: multiple gpu migrate vram to vram
Date: Wed, 14 Apr 2021 21:23:35 -0400
Message-Id: <20210415012337.1755-33-Felix.Kuehling@amd.com>
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
 Transport; Thu, 15 Apr 2021 01:24:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abee0e12-173c-43af-a271-08d8ffad2b9e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4797:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB47978A47E11790FC7048A513924D9@MN2PR12MB4797.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zxBTYaR8ZtLY3r1W1eOxuZlmc4pBxp9Ym8Th7DIHw9BS3OxLPP85Fat3VvDGmI3ZmfpLu6DkkFXWVnljpVloB2hjCWp15RAoD2Hnz0jDx879izLM8w6b/PfByQPOjAzWjQo1hX6FH0UOIGlpx6DLuN7O6D+H5WBlMRXdZgI1X+GYw0kiFxIrjZJtLqQ3+3ZcLMavFzA8dGViTWKAOQdYb8o1dHw07VO8mBuPz5mWIFaolsui26eYyMW7z/pe5lHhpHaS94NN9rQFOHywU7qY+dHypgWbeEL+nrmlh/EYRY+q3ygjxQVf1ZSALn/F0jO/gkxpeVt9AdQHXRRxO19mqqQeXF3sEze2FruVeh6JFVO0uRjREhAqeptdU7GXG8UWhv2ZhdvdQivfdQJAIIakVCB1LQMbCs4Z3tqwZlOqc50c5XtyuWeuhmMCrLiynPz1xc5ARupsg9EsTZ0DJ1m6QO2ybMy03kyVZO5RUVdvA/LBp9LfhY0d8knHpfVsdrpo7Kg5JoU51+Yn0LJ5DUG8tWqBjjBAS7MUFN2lQ2v2K0wJBEjj93JdcCZQ5cRzBRjbuJyfy0nFY2RGJReEFxeMlTshvYKd2mUWnJrLBZgHSB6OAps/KLEDkl/mFOx+4uyEu7Ri6p77LdKH563eeuqB91X+ZFs8YhbTdGKiLFClTRA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(86362001)(66476007)(66946007)(2906002)(38350700002)(186003)(36756003)(16526019)(450100002)(38100700002)(5660300002)(83380400001)(66556008)(4326008)(52116002)(7696005)(478600001)(6486002)(8936002)(2616005)(8676002)(1076003)(6666004)(956004)(26005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1i8jmTggZM1G06ochPO4cEyCVDzjBohF3d1bd0AoZwFSD8JV6KGHwr6F52Va?=
 =?us-ascii?Q?dKWXScYHgZGYiX41UHURzPKxzJqAbuYgrGuVsX/twMa2SEP/o7B7ET/EvgJG?=
 =?us-ascii?Q?w5xY4AYrFwChvDBGZItb6PSYULWlH7rHkYBtYHkrWndHHTKSr7qqCy9Lzq9V?=
 =?us-ascii?Q?xtsjHfIF/hbQlPSgt4rLM4tRtSRVlbIAvnwNmCdHciPMi01kwhHf09WCYd4a?=
 =?us-ascii?Q?lqewborvaaI9p1RFqzZZ7buwvTViMM8gYOTWYmA4UPeqyl5IsAxPpG36mPq2?=
 =?us-ascii?Q?wTnWwwgyrJYtgKSzhaXItlsy6PteB9cqD+DZY/8UQh4B/mhNZAngOhScsWdt?=
 =?us-ascii?Q?1KEa+BHBnvOqAP7XgLFhhwS2iYY68coKi+VZfqCEEio1N1MMfyo0M3TEh4ej?=
 =?us-ascii?Q?2QmgTc+XcNbRVeq4vyv6yftycqxNN0mayK5Qt9lXz2VyDCVuuve1X2QYq0WN?=
 =?us-ascii?Q?B4Z/6XmJOe/3WVZglDk1L5mAL+ldGaTR4LcUFhS04Tj4RqVyWQYGI6hlywoW?=
 =?us-ascii?Q?zC6BkrsFkOQOGoVXHh1vnErO+Z24m+hKqIJpRkS1WUMrd8LBpkgkmRrQGF2L?=
 =?us-ascii?Q?TSNlAzMDSn3ms5ouZ7jLNBEKkkgvOZS8L1fL6TU1WrPTCW225QU+kkBEXY3P?=
 =?us-ascii?Q?xzOkZYIDYE8ldYr9Q01htGDZFM/fPflk+jshnyQcQQiNpBJmi9hht0Gat8hX?=
 =?us-ascii?Q?v4bEOlNIYsBDOFABc4L5tRl07Q0ptSuvIjacfCBSP7PJRuNtkt4rfezwsaKq?=
 =?us-ascii?Q?Bnar0DjukfaIcvece55xdVY2dQUPYiCt+CMsO5C9o9Te1o2GmohLCexDUFGs?=
 =?us-ascii?Q?sNCI26WwKJ1/sJyxuVEWj0cR9B2pouRZQvHaLCJX9J09zzff+BmuUgjRLvL3?=
 =?us-ascii?Q?N338AtmU1GWaPQzXsA8wlctU3Dk5PAOTWP5jimkKnuo7Aj7fBBhZ8jsV8u42?=
 =?us-ascii?Q?mgA66lKUr0txsmIX5I5kjvdGkaOdDWZBRbVXx/hDz9J6veFvYjMcXIrMaElc?=
 =?us-ascii?Q?wh++IsGwK5z8LGJal4w0OICmYeijFm1GhycVufmGA4tDKALho5EBFksDbx+j?=
 =?us-ascii?Q?fI9n4iYvdJNrpzP35TUx/GbVrkaDfILEQ6hFBz3WIQjRsaRsj8+qOQds4yiY?=
 =?us-ascii?Q?lUa8/Vd3s1cXkgwxDuFsQ48sf5laIH+aA+KvoXogddsN7+x2zlLM4n54BlcZ?=
 =?us-ascii?Q?WLRnIUZWui+G6ZrKdwPwuG/uU0XOsr8HgWCUabbwU5yEwmxtkD/Z3k7MwSyM?=
 =?us-ascii?Q?89DoGn0bRRxtlDB+E+hgjaLdb6wtga55SkVey8Q6zv2aavgva6oEv446pPua?=
 =?us-ascii?Q?X7vWI9u+kBVADWPtzbeFJp2C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abee0e12-173c-43af-a271-08d8ffad2b9e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:24:10.0610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IUwuXOQzzCm99XrYGC3OGmpuoesOR/Rvl5KKoqQ0wrQIkPoapaTwaFgYcZq+964z6PJar3zXtYCWYCeCgEO2uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4797
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

If prefetch range to gpu with acutal location is another gpu, or GPU
retry fault restore pages to migrate the range with acutal location is
gpu, then migrate from one gpu to another gpu.

Use system memory as bridge because sdma engine may not able to access
another gpu vram, use sdma of source gpu to migrate to system memory,
then use sdma of destination gpu to migrate from system memory to gpu.

Print out gpuid or gpuidx in debug messages.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 47 +++++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 51 +++++++++++++++++++-----
 3 files changed, 87 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 9c1199d1b61b..7d8659517447 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -487,8 +487,9 @@ svm_migrate_vma_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
  * Return:
  * 0 - OK, otherwise error code
  */
-int svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc,
-			    struct mm_struct *mm)
+static int
+svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc,
+			struct mm_struct *mm)
 {
 	unsigned long addr, start, end;
 	struct vm_area_struct *vma;
@@ -742,6 +743,48 @@ int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm)
 	return r;
 }
 
+/**
+ * svm_migrate_vram_to_vram - migrate svm range from device to device
+ * @prange: range structure
+ * @best_loc: the device to migrate to
+ * @mm: process mm, use current->mm if NULL
+ *
+ * Context: Process context, caller hold mmap read lock, svms lock, prange lock
+ *
+ * Return:
+ * 0 - OK, otherwise error code
+ */
+static int
+svm_migrate_vram_to_vram(struct svm_range *prange, uint32_t best_loc,
+			 struct mm_struct *mm)
+{
+	int r;
+
+	/*
+	 * TODO: for both devices with PCIe large bar or on same xgmi hive, skip
+	 * system memory as migration bridge
+	 */
+
+	pr_debug("from gpu 0x%x to gpu 0x%x\n", prange->actual_loc, best_loc);
+
+	r = svm_migrate_vram_to_ram(prange, mm);
+	if (r)
+		return r;
+
+	return svm_migrate_ram_to_vram(prange, best_loc, mm);
+}
+
+int
+svm_migrate_to_vram(struct svm_range *prange, uint32_t best_loc,
+		    struct mm_struct *mm)
+{
+	if  (!prange->actual_loc)
+		return svm_migrate_ram_to_vram(prange, best_loc, mm);
+	else
+		return svm_migrate_vram_to_vram(prange, best_loc, mm);
+
+}
+
 /**
  * svm_migrate_to_ram - CPU page fault handler
  * @vmf: CPU vm fault vma, address
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
index 53c899b80b85..37ad99cb073d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -38,8 +38,8 @@ enum MIGRATION_COPY_DIR {
 	FROM_VRAM_TO_RAM
 };
 
-int svm_migrate_ram_to_vram(struct svm_range *prange,  uint32_t best_loc,
-			    struct mm_struct *mm);
+int svm_migrate_to_vram(struct svm_range *prange,  uint32_t best_loc,
+			struct mm_struct *mm);
 int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm);
 unsigned long
 svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 7b698b0e4e41..33194f79e862 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -348,8 +348,11 @@ static void svm_range_bo_unref(struct svm_range_bo *svm_bo)
 	kref_put(&svm_bo->kref, svm_range_bo_release);
 }
 
-static bool svm_range_validate_svm_bo(struct svm_range *prange)
+static bool
+svm_range_validate_svm_bo(struct amdgpu_device *adev, struct svm_range *prange)
 {
+	struct amdgpu_device *bo_adev;
+
 	mutex_lock(&prange->lock);
 	if (!prange->svm_bo) {
 		mutex_unlock(&prange->lock);
@@ -361,6 +364,22 @@ static bool svm_range_validate_svm_bo(struct svm_range *prange)
 		return true;
 	}
 	if (svm_bo_ref_unless_zero(prange->svm_bo)) {
+		/*
+		 * Migrate from GPU to GPU, remove range from source bo_adev
+		 * svm_bo range list, and return false to allocate svm_bo from
+		 * destination adev.
+		 */
+		bo_adev = amdgpu_ttm_adev(prange->svm_bo->bo->tbo.bdev);
+		if (bo_adev != adev) {
+			mutex_unlock(&prange->lock);
+
+			spin_lock(&prange->svm_bo->list_lock);
+			list_del_init(&prange->svm_bo_list);
+			spin_unlock(&prange->svm_bo->list_lock);
+
+			svm_range_bo_unref(prange->svm_bo);
+			return false;
+		}
 		if (READ_ONCE(prange->svm_bo->evicting)) {
 			struct dma_fence *f;
 			struct svm_range_bo *svm_bo;
@@ -434,7 +453,7 @@ svm_range_vram_node_new(struct amdgpu_device *adev, struct svm_range *prange,
 	pr_debug("pasid: %x svms 0x%p [0x%lx 0x%lx]\n", p->pasid, prange->svms,
 		 prange->start, prange->last);
 
-	if (svm_range_validate_svm_bo(prange))
+	if (svm_range_validate_svm_bo(adev, prange))
 		return 0;
 
 	svm_bo = svm_range_bo_new();
@@ -1173,6 +1192,7 @@ static int svm_range_map_to_gpus(struct svm_range *prange,
 
 	p = container_of(prange->svms, struct kfd_process, svms);
 	for_each_set_bit(gpuidx, bitmap, MAX_GPU_INSTANCE) {
+		pr_debug("mapping to gpu idx 0x%x\n", gpuidx);
 		pdd = kfd_process_device_from_gpuidx(p, gpuidx);
 		if (!pdd) {
 			pr_debug("failed to find device idx %d\n", gpuidx);
@@ -2198,7 +2218,7 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
 
 	if (prange->actual_loc != best_loc) {
 		if (best_loc) {
-			r = svm_migrate_ram_to_vram(prange, best_loc, mm);
+			r = svm_migrate_to_vram(prange, best_loc, mm);
 			if (r) {
 				pr_debug("svm_migrate_to_vram failed (%d) at %llx, falling back to system memory\n",
 					 r, addr);
@@ -2406,6 +2426,11 @@ svm_range_best_prefetch_location(struct svm_range *prange)
 		goto out;
 
 	bo_adev = svm_range_get_adev_by_id(prange, best_loc);
+	if (!bo_adev) {
+		WARN_ONCE(1, "failed to get device by id 0x%x\n", best_loc);
+		best_loc = 0;
+		goto out;
+	}
 	bitmap_or(bitmap, prange->bitmap_access, prange->bitmap_aip,
 		  MAX_GPU_INSTANCE);
 
@@ -2493,20 +2518,24 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
 	    best_loc == prange->actual_loc)
 		return 0;
 
+	/*
+	 * Prefetch to GPU without host access flag, set actual_loc to gpu, then
+	 * validate on gpu and map to gpus will be handled afterwards.
+	 */
 	if (best_loc && !prange->actual_loc &&
-	    !(prange->flags & KFD_IOCTL_SVM_FLAG_HOST_ACCESS))
+	    !(prange->flags & KFD_IOCTL_SVM_FLAG_HOST_ACCESS)) {
+		prange->actual_loc = best_loc;
 		return 0;
+	}
 
-	if (best_loc) {
-		pr_debug("migrate from ram to vram\n");
-		r = svm_migrate_ram_to_vram(prange, best_loc, mm);
-	} else {
-		pr_debug("migrate from vram to ram\n");
+	if (!best_loc) {
 		r = svm_migrate_vram_to_ram(prange, mm);
+		*migrated = !r;
+		return r;
 	}
 
-	if (!r)
-		*migrated = true;
+	r = svm_migrate_to_vram(prange, best_loc, mm);
+	*migrated = !r;
 
 	return r;
 }
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
